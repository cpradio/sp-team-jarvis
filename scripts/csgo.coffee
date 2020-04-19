# Description:
#   CSGO
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   csgo|cs:go|couterstrike|counter strike - response that will hopefully irritate Ryan #nuisance
#
# Author:
#   cpradio

_ = require 'underscore'

responses = [
  "BOOM! HEADSHOT!!",
  "_cpradio_ shoots {user} in the foot!",
  "Shouldn't you be working instead of playing your 'little' game?"
]

module.exports = (robot) ->
  robot.hear /\b(cs:?go|counter\s?strike)\b/i, (msg) ->
    _.shuffle(responses)
    msg.send responses[0].replace /{user}/gi, msg.message.user.name
