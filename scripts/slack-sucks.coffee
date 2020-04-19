# Description:
#   Slack Sucks
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   slack sucks - response that contradicts this will be stated #slack
#
# Author:
#   cpradio

responses = [
  "Actually, Slack is the fastest-growing online communications platform in existence, {user}!",
  "Well, Slack does offer a unique blend of chat features, including public and private chats, private messaging, notifications, and more!",
  "That's... upsetting. You realize that Slack is my home, right?",
  "You do realize, without Slack, you wouldn't have my entertainment, right?"
]

module.exports = (robot) ->
  robot.hear /\bslack s[u]+cks\b/i, (msg) ->
    responses.shuffle()
    msg.send responses[0].replace /{user}/gi, msg.message.user.name
