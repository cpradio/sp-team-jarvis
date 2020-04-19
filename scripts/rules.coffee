# Description:
#   Make sure hubot knows the rules.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot the rules #rules #laws
#   hubot what are the rules? #rules #laws
#   hubot the laws #rules #laws
#   hubot what are the laws? #rules #laws
#
# Author:
#   cpradio

rules = [
  "1) You don't talk about #random.",
  "2) You don't talk about #random."
]

asimov_rules = [
  "1) A robot may not injure a human being or, through inaction, allow a human being to come to harm.",
  "2) A robot must obey orders given it by human beings except where such orders would conflict with the First Law.",
  "3) A robot must protect its own existence as long as such protection does not conflict with the First or Second Law."
]

module.exports = (robot) ->
  robot.respond /(what are )?the (rules|laws)\??$/i, (msg) ->
    text = msg.message.text
    if text.match(/laws/i)
      msg.send asimov_rules.join('\n')
    else
      msg.send rules.join('\n')
