# Description:
#   Show a "ninja'd" image when someone says "ninja'd"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ninja'd - Display a ninja'd image #meme
#
# Author:
#   cpradio

images = [
  "http://i.imgur.com/qwkbzf5.png",
  "https://c1.staticflickr.com/3/2533/3967014086_ddc4536b4a.jpg",
  "http://pinkie.mylittlefacewhen.com/media/f/rsz/mlfw4912_medium.jpg"
]

module.exports = (robot) ->
  robot.hear /\b(ninja|ninja'd|ninjad|ninja’d)\b/i, (msg) ->
    msg.send msg.random images
