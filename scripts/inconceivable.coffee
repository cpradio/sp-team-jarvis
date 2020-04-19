# Description:
#   Show a "Inconceivable!" image when someone says "inconceivable"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   inconceivable - displays a inconceivable! image #meme
#
# Author:
#   cpradio

images = [
  "http://i.imgur.com/J1VZuRp.gif",
  "http://i.imgur.com/nBMYlPO.jpg"
]

module.exports = (robot) ->
  robot.hear /\binconceivable!?\b/i, (msg) ->
    msg.send msg.random images
