# Description:
#   Generates memes via the Imgflip Meme Generator API
#
# Dependencies:
#   None
#
# Configuration:
#   IMGFLIP_API_USERNAME [optional, overrides default imgflip_hubot account]
#   IMGFLIP_API_PASSWORD [optional, overrides default imgflip_hubot account]
#
# Commands:
#   hubot One does not simply <text> - Lord of the Rings Boromir #meme
#   hubot I don't always <text> but when i do <text> - The Most Interesting man in the World #meme
#   hubot aliens <text> - Ancient Aliens History Channel Guy #meme
#   hubot grumpy cat <text> - Grumpy Cat with text on the bottom #meme
#   hubot <text>, <text> everywhere - X, X Everywhere (Buzz and Woody from Toy Story) #meme
#   hubot Not sure if <text> or <text> - Futurama Fry #meme
#   hubot Y U NO <text> - Y U NO Guy #meme
#   hubot Brace yourselves <text> - Brace Yourselves X is Coming (Imminent Ned, Game of Thrones) #meme
#   hubot <text> all the <text> - X all the Y #meme
#   hubot <text> that would be great - Bill Lumbergh from Office Space #meme
#   hubot <text> too damn <text> - The rent is too damn high #meme
#   hubot Yo dawg <text> so <text> - Yo Dawg Heard You (Xzibit) #meme
#   hubot <text> you're gonna have a bad time - Super Cool Ski Instructor from South Park #meme
#   hubot Am I the only one around here <text> - The Big Lebowski #meme
#   hubot What if I told you <text> - Matrix Morpheus #meme
#   hubot <text> ain't nobody got time for that #meme
#   hubot <text> I guarantee it - George Zimmer #meme
#   hubot <text> and it's gone - South Park Banker Guy #meme
#   hubot <text> nobody bats an eye <text> everyone loses their minds - Heath Ledger Joker #meme
#   hubot back in my day <text> - Grumpy old man #meme
#   hubot <text> they said, <text> they said - Laundry Viking #meme
#   hubot no <text> for you! - Soup Nazi #meme
#   hubot i can haz <text> - i can haz kitty #meme
#   hubot one of us - one of us aliens from Toy Story #meme
#   hubot <text> shut up and take my money - Futurama Fry - Shut up and take my money #meme
#   hubot this is <text> - Sparta - This is Sparta! #meme
#   hubot <text>, you keep using that word. <text> - You Keep Using That Word meme #meme
#   hubot my name is inigo montoya, you <text>, prepare to die! - Prepare to Die meme #meme
#   hubot you shall not <text> - Gandalf - You Shall Not ... meme #meme
#   hubot <text> it's over 9000 - Over 9000 meme #meme
#   hubot i see <text> - I see dead people meme #meme
#   hubot there can only be one <text> - highlander meme #meme
#   hubot <text>, but then I took an arrow to the knee - arrow to the knee meme #meme
#
# Author:
#   dylanwenzlau and cpradio


inspect = require('util').inspect

module.exports = (robot) ->
  unless robot.brain.data.imgflip_memes?
    robot.brain.data.imgflip_memes = [
      {
        regex: /(i pity the fool) (.*)/i,
        template_id: 1570716
      },
      {
        regex: /(one does not simply) (.*)/i,
        template_id: 61579
      },
      {
        regex: /(i don'?t always .*) (but when i do,? .*)/i,
        template_id: 61532
      },
      {
        regex: /aliens ()(.*)/i,
        template_id: 101470
      },
      {
        regex: /grumpy cat (.*)[,.] (.*)/i,
        template_id: 405658
      },
      {
        regex: /(.*),? (\1 everywhere)/i,
        template_id: 347390
      },
      {
        regex: /(not sure if .*) (or .*)/i,
        template_id: 61520
      },
      {
        regex: /(y u no) (.+)/i,
        template_id: 61527
      },
      {
        regex: /(brace yoursel[^\s]+) (.*)/i,
        template_id: 61546
      },
      {
        regex: /(.*) (all the .*)/i,
        template_id: 61533
      },
      {
        regex: /(.*) (that would be great|that'?d be great)/i,
        template_id: 563423
      },
      {
        regex: /(.*) (\w+\stoo damn .*)/i,
        template_id: 61580
      },
      {
        regex: /(yo dawg .*) (so .*)/i,
        template_id: 101716
      },
      {
        regex: /(.*) (.* gonna have a bad time)/i,
        template_id: 100951
      },
      {
        regex: /(am i the only one around here) (.*)/i,
        template_id: 259680
      },
      {
        regex: /(what if i told you) (.*)/i,
        template_id: 100947
      },
      {
        regex: /(.*) (ain'?t nobody got time for? that)/i,
        template_id: 442575
      },
      {
        regex: /(.*) (i guarantee it)/i,
        template_id: 10672255
      },
      {
        regex: /(.*) (a+n+d+ it'?s gone)/i,
        template_id: 766986
      },
      {
        regex: /(.* bats an eye) (.* loses their minds?)/i,
        template_id: 1790995
      },
      {
        regex: /(back in my day) (.*)/i,
        template_id: 718432
      },
      {
        regex: /(.* they said), (.* they said)/i,
        template_id: 36986734
      },
      {
        regex: /()(no .* for you!)/i,
        template_id: 10585695
      },
      {
        regex: /(i can haz) (.*)/i,
        template_id: 16558355
      },
      {
        regex: /()((one of us\s?)+)/i,
        template_id: 39605493
      },
      {
        regex: /(.* )?(shut up and take my money)/i,
        template_id: 176908
      },
      {
        regex: /()(this is .*)/i,
        template_id: 4607993
      },
      {
        regex: /(.*,? you keep using that word.?) (.*)/i,
        template_id: 10453954
      },
      {
        regex: /(my name is inigo montoya,?) (you .*,? prepare to die!?)/i,
        template_id: 10453954
      },
      {
        regex: /()(you shall not .*)/i,
        template_id: 8022730
      },
      {
        regex: /(.*) (it'?s over 9,?000[!]*)/i,
        template_id: 17945553
      },
      {
        regex: /()(i see .*)/i,
        template_id: 19272969
      },
      {
        regex: /(there can only be one) (.*)/i,
        template_id: 19586218
      },
      {
        regex: /(.*), (but then I took an arrow to the knee)/i,
        template_id: 31354503
      }
    ]

  for meme in robot.brain.data.imgflip_memes
    setupResponder robot, meme

setupResponder = (robot, meme) ->
  robot.respond meme.regex, (msg) ->
    generateMeme msg, meme.template_id, msg.match[1], msg.match[2]

generateMeme = (msg, template_id, text0, text1) ->
  username = process.env.IMGFLIP_API_USERNAME
  password = process.env.IMGFLIP_API_PASSWORD

  if (username or password) and not (username and password)
    msg.reply 'To use your own Imgflip account, you need to specify username and password!'
    return

  if not username
    username = 'imgflip_hubot'
    password = 'imgflip_hubot'

  msg.http('https://api.imgflip.com/caption_image')
  .query
      template_id: template_id,
      username: username,
      password: password,
      text0: text0,
      text1: text1
  .post() (error, res, body) ->
    if error
      msg.reply "I got an error when talking to imgflip:", inspect(error)
      return

    result = JSON.parse(body)
    success = result.success
    errorMessage = result.error_message

    if not success
      msg.reply "Imgflip API request failed: #{errorMessage}"
      return

    msg.send result.data.url
