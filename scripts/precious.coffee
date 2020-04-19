# Description:
#   Show a Gollum image when someone says "my precious"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   my precious - displays a gollum #meme
#
# Author:
#   cpradio

images = [
  "http://s2.quickmeme.com/img/df/df0ff33f266f32214d219b927452e45fc1dffeaee2a32c2df03cac793d08d36a.jpg",
  "http://s2.quickmeme.com/img/2c/2c91d4d4ca06cddb4ce5caf66129a938cd28e0f20dd0ebf4e1d766bd1612ad90.jpg",
  "http://cdn.meme.am/instances/53130381.jpg",
  "http://www.quickmeme.com/img/6e/6e30d7a7441a6c32a0cbd461fe3bb6fa90594d8f6aad669d74fa0428fec34fce.jpg",
  "http://memecrunch.com/meme/1SVLB/you-re-my-precious/image.jpg"
]

module.exports = (robot) ->
  robot.hear /\bmy precious\b/i, (msg) ->
    msg.send msg.random images
