# Description:
#   Show a "YOU CAN'T HANDLE THE TRUTH" image when someone says "truth"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   truth - displays a you can't handle the truth image #meme
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/RLnQndx.jpg",
  "http://i.imgur.com/mveIWup.jpg",
  "http://i.imgur.com/N5cxU3Q.jpg",
  "http://i.imgur.com/iQsXkmm.jpg",
  "http://i.imgur.com/HgYeBgx.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[t]+ruth\b/i, (msg) ->
    msg.send msg.random images
