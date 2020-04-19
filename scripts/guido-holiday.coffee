# Description:
#   Guido Holiday Responses
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is guido on holiday? #nuisance
#   hubot is guido always on holiday? #nuisance
#   hubot where is guido? #nuisance
#   hubot what is guido doing? #nuisance
#
# Author:
#   cpradio

holiday_responses = [
  "Yes, definitely on holiday",
  "There is a good chance he is on holiday right now.",
  "Of course he is!"
]

activity_responses = [
  "He is probably \"working from home\", or as the rest of us see it, not doing anything.",
  "He probably went out for ice cream.",
  "He is relaxing at the beach.",
  "He might be taking a bike ride."
]

module.exports = (robot) ->
  robot.respond /is @?guido(2004)?( always)? on holiday\??/i, (msg) ->
    user = msg.message.user.id
    if user == "U04L98BMK"
      msg.send "Shouldn't you know if you are on holiday or not?"
    else
      msg.send msg.random holiday_responses

  robot.respond /(what|where) is @?guido(2004)?( doing)?\??/i, (msg) ->
    user = msg.message.user.id
    if user == "U04L98BMK"
      msg.send "Are you lost or confused @guido2004? Do I need to call for help?"
    else
      msg.send msg.random activity_responses
