# Description:
#   Show a "SILENCE I KILL YOU" image when someone says "silence"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   silence - displays a silence i kill you image #meme
#
# Author:
#   cpradio

images = [
  "http://www.motifake.com/image/demotivational-poster/0807/silence-wann1e-demotivational-poster-1217008369.jpg",
  "http://www.quickmeme.com/img/14/14ff2b3b4b83ef88a0ccb596cc2ef4e138bf96554ee8d5542817cfd2a93db2f1.jpg",
  "http://cdn.meme.am/instances/400x/61339505.jpg",
  "http://www.quickmeme.com/img/b5/b594d0c9ead3e830ed62394dad842109d6aa20df5e3a553d602d1b9896a66530.jpg",
  "http://www.quickmeme.com/img/31/314f3a567f4128c62fee1bc00f35ad047bd9575d768159e2ca7caef0c8acef4c.jpg"
]

module.exports = (robot) ->
  robot.hear /\bs[i]+lence\b/i, (msg) ->
    msg.send msg.random images
