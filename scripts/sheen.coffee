# Description:
#   Charlie Sheens!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sheen me - A randomly selected Charlie Sheen #bomb #sheen
#   hubot sheen me <w>x<h> - A Charlie Sheen of the given size #bomb #sheen
#   hubot sheen bomb me <number> - Many many Charlie Sheens! #bomb #sheen
#
# Author:
#   dstrelau

module.exports = (robot) ->
  robot.respond /(sheen)s?(?: me)?$/i, (msg) ->
    msg.send sheenMe()

  robot.respond /(sheen)s?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send sheenMe msg.match[2], (msg.match[3] || msg.match[4])

  robot.respond /(sheen) bomb(?: me)?( \d+)?$/i, (msg) ->
    sheens = msg.match[2] || 5
    msg.send(sheenMe()) for i in [1..sheens]

sheenMe = (height, width)->
  h = height ||  Math.floor(Math.random()*250) + 250
  w = width  || Math.floor(Math.random()*250) + 250
  root = "http://placesheen.com"
  return "#{root}/#{h}/#{w}"
