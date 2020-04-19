# Description:
#   Show a "Resistance is Futile" image when someone says "resistance"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   resistance - displays a resistance is futile image #meme
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/LLj2Ao3.jpg",
  "http://i.imgur.com/rTBm0OW.jpg",
  "http://i.imgur.com/aNaXEBD.jpg",
  "http://i.imgur.com/1hUNW3z.jpg",
  "http://i.imgur.com/wVpzxoi.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[r]+esistance\b/i, (msg) ->
    msg.send msg.random images
