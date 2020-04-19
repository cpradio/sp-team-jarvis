# Description:
#   Show a "That Escalated Quickly" image when someone says "escalated"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   escalated - displays a that escalated quickly image #meme
#
# Author:
#   jeffreylees

images = [
  "http://i.imgur.com/lCSgjBK.jpg",
  "http://i.imgur.com/U5I5CVI.jpg",
  "http://i.imgur.com/F8JFlZb.jpg",
  "http://i.imgur.com/TC62suS.jpg",
  "http://i.imgur.com/8g0tYHO.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[e]+scalated\b/i, (msg) ->
    msg.send msg.random images
