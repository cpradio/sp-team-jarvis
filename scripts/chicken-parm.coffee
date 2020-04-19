# Description:
#   Applies when Ryan mentions chicken parm
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   None
#
# Author:
#   cpradio

responses = [
  "bock, bock, bock, bock, bock, begowwwwk",
  "cockadoodle dooooooooooooooooooooooooooo",
  "brrk, brroock, broock, brk-ooock"
]

module.exports = (robot) ->
  robot.hear /chicken(\s)+parm/i, (msg) ->
    sender = msg.message.user.id.toUpperCase()
    if sender == 'U0456SVK9'
      msg.send msg.random responses