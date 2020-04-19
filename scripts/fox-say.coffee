# Description:
#   What does the Fox say?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what does the fox say? #songs
#
# Author:
#   cpradio

responses = [
  "Ring-ding-ding-ding-dingeringeding!",
  "Wa-pa-pa-pa-pa-pa-pow!",
  "Joff-tchoff-tchoff-tchoffo-tchoffo-tchoff!",
  "Jacha-chacha-chacha-chow!",
  "Fraka-kaka-kaka-kaka-kow!",
  "A-hee-ahee ha-hee!",
  "A-oo-oo-oo-ooo!"
]

module.exports = (robot) ->
  robot.respond /what does the fox say\??$/i, (msg) ->
    return msg.send msg.random responses
