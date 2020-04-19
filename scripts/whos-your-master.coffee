# Description:
#   Who's your master?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot who's the|your boss|master? #slack #commands
#   hubot who is the|your boss|master? #slack #commands
#
# Author:
#   cpradio

responses = {
  'cpradio': "You are, O Great One!",
  'molona': "Although your perfection astounds me, you are not my {term}.",
  'other': "My {term} is the all powerful, all wonderful, cpradio (and the other creators whose scripts I possess)!"
}

module.exports = (robot) ->
  robot.respond /who('s| is) (the|your) (master|boss)\??$/i, (msg) ->
    masterMe msg

masterMe = (msg) ->
    term = msg.match[3]
    sender = msg.message.user.name.toLowerCase()
    if sender of responses
      msg.send responses[sender].replace /{term}/, term
    else
      msg.send responses['other'].replace /{term}/, term
