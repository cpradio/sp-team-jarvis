# Description:
#   Show combo breaker images
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   combo breaker - displays a related image #meme
#
# Author:
#   cpradio

images = [
  "https://i.ytimg.com/vi/9l2S4g603HI/hqdefault.jpg",
  "https://i.ytimg.com/vi/vY6aJKki3AM/hqdefault.jpg",
  "http://cf.chucklesnetwork.agj.co/items/3/3/7/1/1/c-c-combo-breaker-success.jpg"
]

module.exports = (robot) ->
  robot.hear /\b[c-]+ombo breaker\b/i, (msg) ->
    msg.send msg.random images

