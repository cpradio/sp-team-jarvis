# Description:
#   Show an "Admiral Ackbar" image when someone says "it's a trap"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   it's a trap - Display an Admiral Ackbar image #meme
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/WEr8rpq.png",
  "http://i.imgur.com/D1nCIJP.jpg",
  "http://i.imgur.com/QxB769A.jpg",
  "http://i.imgur.com/LXAbDwt.jpg",
  "http://i.imgur.com/M85TILw.jpg",
  "http://i.imgur.com/94E0gCg.png",
  "http://i.imgur.com/JPKQKNy.jpg"
]

module.exports = (robot) ->
  robot.hear /\bit'?s a trap\b/i, (msg) ->
    msg.send msg.random images
