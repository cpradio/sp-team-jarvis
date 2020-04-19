# Description:
#   The game of Hangman.
#   Words and definitions are sourced via the Wordnik API. You'll need an API
#   key from http://developer.wordnik.com/
#
# Dependencies:
#   None
#
# Configuration:
#   WORDNIK_API_KEY
#
# Commands:
#   hubot hangman - Display the state of the current game #games
#   hubot hangman <letterOrWord> - Make a guess #games
#   hubot hangman -<letter> - Add letter to ruled out list #games
#
# Author:
#   kandrews
#   harukizaemon
#   cpradio

class Game

  constructor: (word, @definitions) ->
    @word = word.toUpperCase()
    @wordLetters = @word.split(//)
    @answerLetters = ("?" for letter in @wordLetters)
    this.guessDash()
    this.guessSpace()
    @remainingGuesses = 9
    @previousGuessedLetters = ["-", " "]
    @previousGuessedWords = []
    @ruledOutLetters = []
    @message = null

  isFinished: ->
    this.wasAnswered() or this.wasHung()

  wasAnswered: ->
    "?" not in @answerLetters

  wasHung: ->
    @remainingGuesses == 0

  guess: (guess) ->
    guess = guess || ""
    guess = guess.trim().toUpperCase()

    if guess.length == 0
      this.noGuess()
      return

    if guess.length == 2 && guess.match /-(.*)/i
      ruledOutLetter = guess.substring 1
      if ruledOutLetter in @ruledOutLetters
        this.duplicateRuledOutLetter(ruledOutLetter)
      else
        this.addRuledOutLetter(ruledOutLetter)
    else
      if guess in @previousGuessedLetters || guess in @previousGuessedWords
        this.duplicateGuess(guess)
      else
        switch guess.length
          when 1
            this.guessLetter(guess)
            @previousGuessedLetters.push(guess)
          when @word.length
            this.guessWord(guess)
            @previousGuessedWords.push(guess)
          else
            this.errantWordGuess(guess)
            @previousGuessedWords.push(guess)

  guessDash: ->
    indexes = (index for letter, index in @wordLetters when "-" == letter)
    if indexes.length > 0
      @answerLetters[index] = @wordLetters[index] for index in indexes

  guessSpace: ->
    indexes = (index for letter, index in @wordLetters when " " == letter)
    if indexes.length > 0
      @answerLetters[index] = @wordLetters[index] for index in indexes

  guessLetter: (guess) ->
    indexes = (index for letter, index in @wordLetters when guess == letter)
    if indexes.length > 0
      @answerLetters[index] = @wordLetters[index] for index in indexes
      this.correctGuess("Yes, there #{isOrAre(indexes.length, guess)}")
    else
      this.incorrectGuess("Sorry, there are no #{guess}'s")

  guessWord: (guess) ->
    if guess == @word
      @answerLetters = @wordLetters
      this.correctGuess("Yes, that's correct")
    else
      this.incorrectGuess("Sorry, the word is not #{guess}")

  noGuess: ->
    @message = null

  duplicateRuledOutLetter: (guess) ->
    @message = "You already ruled out #{guess} so let's pretend that never happened, shall we?"

  addRuledOutLetter: (guess) ->
    @message = "Added #{guess} to your ruled out list."
    @ruledOutLetters.push(guess)

  errantWordGuess: (guess) ->
    @message = "The word #{guess} isn't the correct length so let's pretend that never happened, shall we?"

  duplicateGuess: (guess) ->
    @message = "You already tried #{guess} so let's pretend that never happened, shall we?"

  correctGuess: (message) ->
    @message = message

  incorrectGuess: (message) ->
    @remainingGuesses -= 1 if @remainingGuesses > 0
    @message = message

  eachMessage: (callback) ->
    callback(@message) if @message

    if this.isFinished()
      if this.wasHung()
        callback("You have no remaining guesses")
      else if this.wasAnswered()
        callback("Congratulations, you still had #{pluralisedGuess(@remainingGuesses)} remaining!")

      callback("The #{@wordLetters.length} letter word was: *#{@word}*")
      callback(@definitions)
    else
      callback("The #{@answerLetters.length} letter word is: *#{@answerLetters.join(' ')}*")
      callback("You have #{pluralisedGuess(@remainingGuesses)} remaining")
      if @previousGuessedLetters.length > 2
        guessOutput = @previousGuessedLetters.filter (x) -> x != "-" && x != " "
        callback("Letters used: _#{guessOutput.join(' ')}_")
      if @previousGuessedWords.length > 0
        callback("Guessed Words: _#{@previousGuessedWords.join(', ')}_")
      if @ruledOutLetters.length > 0
        callback("Ruled out: _#{@ruledOutLetters.join(' ')}_")

module.exports = (robot) ->
  gamesByRoom = {}

  robot.respond /hangman( .*)?$/i, (msg) ->

    if process.env.WORDNIK_API_KEY == undefined
      msg.send("Missing WORDNIK_API_KEY env variable.")
      return

    room = msg.message.user.room

    play msg, gamesByRoom[room], (game) ->
      gamesByRoom[room] = game
      game.guess(msg.match[1])
      game.eachMessage (message) -> msg.send(message)

play = (msg, game, callback) ->
  if !game or game.isFinished()
    generateWord msg, (word, definitions) -> callback new Game(word, definitions)
  else
    callback(game)

generateWord = (msg, callback) ->
  msg.http("http://api.wordnik.com/v4/words.json/randomWord")
  .query
      hasDictionaryDef: true
      minDictionaryCount: 3
      minLength: 5
  .headers
      api_key: process.env.WORDNIK_API_KEY
  .get() (err, res, body) ->
    result = JSON.parse(body)
    word = if result
      result.word
    else
      "hangman"

    defineWord(msg, word, callback)

defineWord = (msg, word, callback) ->
  msg.http("http://api.wordnik.com/v4/word.json/#{escape(word)}/definitions")
  .header("api_key", process.env.WORDNIK_API_KEY)
  .get() (err, res, body) ->
    definitions = JSON.parse(body)

    if definitions.length == 0
      callback(word, "No definitions found.")
    else
      reply = ""
      lastSpeechType = null

      definitions = definitions.forEach (def) ->
# Show the part of speech (noun, verb, etc.) when it changes
        if def.partOfSpeech != lastSpeechType
          reply += " (#{def.partOfSpeech})\n" if def.partOfSpeech != undefined

        # Track the part of speech
        lastSpeechType = def.partOfSpeech

        # Add the definition
        reply += "  - #{def.text}\n"

      callback(word, reply)

isOrAre = (count, letter) ->
  if count == 1
    "is one #{letter}"
  else
    "are #{count} #{letter}'s"

pluralisedGuess = (count) ->
  if count == 1
    "one guess"
  else
    "#{count} guesses"
