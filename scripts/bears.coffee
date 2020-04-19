# Description:
#   Bears!
#
# Dependencies:
#   None
#
# Configuration:
#   None
# 
# Commands:
#   hubot bear me - A randomly selected bear #bomb
#   hubot bear me <w>x<h> - A bear of the given size #bomb #bears
#   hubot bear bomb me <number> - Many many bears! #bomb #bears
#
# Author:
#   dstrelau

module.exports = (robot) ->
  robot.respond /(bear)s?(?: me)?$/i, (msg) ->
    msg.send bearMe()

  robot.respond /(bear)s?(?: me)? (\d+)(?:[x ](\d+))?$/i, (msg) ->
    msg.send bearMe msg.match[2], (msg.match[3] || msg.match[4])

  robot.respond /(bear) bomb(?: me)?( \d+)?$/i, (msg) ->
    bears = msg.match[2] || 5
    msg.send(bearMe()) for i in [1..bears]

bearMe = (height, width)->
  h = height ||  Math.floor(Math.random()*250) + 250
  w = width  || Math.floor(Math.random()*250) + 250
  root = "http://placebear.com"
  root += "/g" if Math.random() > 0.5 # greyscale bears!
  return "#{root}/#{h}/#{w}"
