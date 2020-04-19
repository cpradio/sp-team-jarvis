# Description:
#   Who Am I?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot who am i? #slack #commands
#
# Author:
#   cpradio

module.exports = (robot) ->
  watching = {
    'cpradio': {
      responses: [
        "My all powerful and wonderful master of course!"
      ]
    },
    'guest': {
      responses: [
        "Uhh... I don't think I've ever seen you before!",
        "Hey {user}! How have you been? I was waiting for you to show up today.",
        "Why aren't you the servant to my Master? The all powerful and wonderful cpradio.",
        "If you don't know who you are, a university is an expensive way to find out.",
        "Always remember that you are absolutely unique. Just like everyone else."
      ]
    }
  }

  robot.respond /who am i\??/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()

    response = "";
    if sender of watching
      watching[sender].responses.shuffle()
      response = watching[sender].responses[0]
    else
      watching["guest"].responses.shuffle()
      response = watching[sender].responses[0]

    response = response.replace /{user}/, sender
    msg.send response
