# Description:
#   message when a user enters/leaves
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   None
#
# Author:
#   cpradio

entering_messages = [
  "Hello, it's me... I was wondering if after all these years you'd like to meet.",
  "Hello, can you hear me? I'm in California dreaming about who we used to be.",
  "Hello from the other side!!! I must have called a thousand times!!!",
  "Hello from the outside!!! At least I can say that I've tried!!!",
  "Hello, how are you? It's so typical of me to talk about myself, I'm sorry..."
]

module.exports = (robot) ->
  robot.enter (msg) ->
    msg.send msg.random entering_messages

  robot.leave (msg) ->
    msg.send "dun dun dun, another one bites the dust!"
