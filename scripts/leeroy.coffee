# Description:
#   Show youtube video when someone says 'leeroy'
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   leeroy - displays its related youtube video #meme
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\ble[e]+[r]+[o]+[y]+\b/i, (msg) ->
    msg.send 'https://www.youtube.com/watch?v=mLyOj_QD4a4'
