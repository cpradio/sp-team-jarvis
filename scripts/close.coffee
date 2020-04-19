# Description:
#   Show a "No Cigar" image when someone says "close"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   close - Display a no cigar image #nuisance
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/W8skjnc.jpg"
]

module.exports = (robot) ->
  robot.hear /\bclose\b/i, (msg) ->
    if !/\bissues close #?([0-9]+)\b/i.test msg.message.rawText
      msg.send msg.random images
