# Description:
#   Sloths!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sloth me - A randomly selected sloth #bomb #sloths
#   hubot sloth me <w>x<h> - A sloth of the given size #bomb #sloths
#   hubot sloth bomb me <number> - Many many sloths! #bomb #sloths
#
# Author:
#   dstrelau

module.exports = (robot) ->
  robot.respond /(sloth)s?(?: me)?$/i, (msg) ->
    msg.send slothMe()

  robot.respond /(sloth)s?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send slothMe msg.match[2], (msg.match[3] || msg.match[4])

  robot.respond /(sloth) bomb(?: me)?( \d+)?$/i, (msg) ->
    sloths = msg.match[2] || 5
    msg.send(slothMe()) for i in [1..sloths]

slothMe = (height, width)->
  h = height ||  Math.floor(Math.random()*250) + 250
  w = width  || Math.floor(Math.random()*250) + 250
  root = "http://place-sloth.com"
  return "#{root}/#{h}/#{w}"
