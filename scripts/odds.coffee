# Description:
#   Show a "Never Tell Me the Odds" image when someone says "odds"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   odds - displays a never tell me the odds image #meme
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/LmolwuM.jpg",
  "http://i.imgur.com/EoCPpdH.jpg",
  "http://i.imgur.com/teI5JAK.jpg",
  "http://i.imgur.com/Z290Fkz.jpg",
  "http://i.imgur.com/3ywbIXS.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[o]+dds\b/i, (msg) ->
    msg.send msg.random images
