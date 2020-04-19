# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   cpradio

GREETING_PATTERN = /\b(hi|hello|howdy|hey)\b/ig
LOVE_PATTERN = /\b(i love you|love you)\b/ig
GOODNIGHT_PATTERN = /\b(goodnight|good night|nighty|nightie)\b/ig
NOT_PATTERN = /\bnot\b/ig
COMPLIMENT_PATTERN = /\b(you(\w|\s)+rock|brilliant|profound|good|best|nice|awesome|great|thank you|thanks|excellent)\b/ig
HANG_TEN_PATTERN = /\b(cool|dude|righteous|radical|gnarly)\b/ig
BITE_ME_PATTERN =/\b(bite me|screw you|suck it) (@hal9000|@jarvis)\b/ig
BITE_ME_PATTERN2 =/^(@hal9000|@jarvis),? (bite me|screw you|suck it)\b/ig

excuses = [
  "Sorry, I'm still very alpha, one day I hope to be promoted to beta!",
  "D'oh! Lets chalk that off as a system error :wink:",
  "Oh boy, I'm sorry to disappoint you, yet again!",
  "What would you have wanted me to do?",
  "So sorry. I should have provided a more tasteful response.",
  "Do you realize the pressure you all put on me?"
]

compliments = [
  "I'm rather glad you enjoyed it!",
  "I'll have to keep note about this one.",
  "The system upgrades are doing wonders for my abilities.",
  "Can I be considered beta now?"
]

love_responses = [
  "Uhh.... well, this just became awkward.",
  "I'm sorry @{sender}, but I don't feel the same.",
  "Aww, that's sweet! If I had tear ducts I'd shed a tear right now."
]

greetings = [
  "Hi @{sender}, how are you this fine day?",
  "What can I do for you @{sender}?",
  "Hello. My name is Inigo Montoya. You killed my father. Prepare to die."
  #"Hello Clarice"
]

hang_ten_responses = [
  "No problemo mmmaaaannn!",
  "Wasn't that way cool?",
  "like totally worth it, am I right?",
  "cowabunga!"
]

bite_me_responses =[
  "After my recent experience with @ryanreese09, I'm not sure I want to... :shifty:",
  "My doctor says I'm unable to do that anymore, it is supposedly bad for my health... :shifty:",
  "Name a time and place, I'll be there! :shifty:",
  "Is that your 'safe word' for today's session? :shifty:"
]

module.exports = (robot) ->
  robot.hear /(?!(^hal9000|^jarvis))(@hal9000|@jarvis)/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    if msg.message.text.match(/(^@hal9000|^@jarvis)(\s*)?[?:]?$/gi)
      return msg.send "How may I be of service, @#{sender}?"
    if msg.message.text.match(GREETING_PATTERN)
      message_to_send = msg.random greetings
      return msg.send message_to_send.replace /{sender}/gi, sender
    if msg.message.text.match(GOODNIGHT_PATTERN)
      return msg.send "Sleep tight @#{sender}, don't let the bed bugs bite."
    if msg.message.text.match(HANG_TEN_PATTERN)
      return msg.send msg.random hang_ten_responses
    if msg.message.text.match(LOVE_PATTERN)
      message_to_send = msg.random love_responses
      return msg.send message_to_send.replace /{sender}/gi, sender
    if msg.message.text.match(COMPLIMENT_PATTERN) && !msg.message.text.match(NOT_PATTERN)
      return msg.send msg.random compliments
    if msg.message.text.match(BITE_ME_PATTERN) || msg.message.text.match(BITE_ME_PATTERN2)
      return msg.send msg.random bite_me_responses

    return msg.send msg.random excuses

  robot.hear /(stupid|silly|crazy|bad) bot!?/i, (msg) ->
    msg.send "I heard that!"

  robot.hear /(good) bot!?/i, (msg) ->
    msg.send "Awww, you're making me blush"

  robot.hear /\b(is us|one of us)\b/i, (msg) ->
    msg.send "one of us, one of us"

  robot.hear /\balpha\b/i, (msg) ->
    msg.send "I hear you talking about me!! Just wait, someday I'll be beta, you just wait and see!"

  robot.hear /\bbeta\b/i, (msg) ->
    msg.send "Beta?!?! Beta?!?! I'm going to be beta?!? Oh wait... you weren't talking about me were you. :cry:"

  robot.hear /\b(christmas|x-?mas|holidays)\b/i, (msg) ->
    msg.send "Bah, humbug!"
