# Description:
#   zero fucks were given that day
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   :fu: - response with "zero ***** were given that day" #nuisance
#   hubot whatever #nuisance
#   hubot how many fucks were given that day? #nuisance
#   hubot how many ***** were given that day? #nuisance
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.hear /\:fu\:/i, (msg) ->
    msg.send "zero ***** were given that day"

  robot.respond /(whatever|how many (fucks|[*]{1,5}) were given that day\??)/i, (msg) ->
    msg.send "zero ***** were given that day"
