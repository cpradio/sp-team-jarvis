# Description:
#   Kittens!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot kitten|cat me - A randomly selected kitten #bomb #kittens
#   hubot kitten|cat me <w>x<h> - A kitten of the given size #bomb #kittens
#   hubot kitten|cat bomb me <number> - Many many kittens! #bomb #kittens
#
# Author:
#   dstrelau

module.exports = (robot) ->
  robot.respond /(kitten|cat)s?(?: me)?$/i, (msg) ->
    msg.send kittenMe()

  robot.respond /(kitten|cat)s?(?: me)? (\d+)(?:[x ])?(\d+)$/i, (msg) ->
    msg.send kittenMe msg.match[2], (msg.match[3] || msg.match[4])

  robot.respond /(kitten|cat) bomb(?: me)?( \d+)?$/i, (msg) ->
    kittens = msg.match[2] || 5
    msg.send(kittenMe()) for i in [1..kittens]

kittenMe = (height, width)->
  h = height ||  Math.floor(Math.random()*250) + 250
  w = width  || Math.floor(Math.random()*250) + 250
  root = "http://placekitten.com"
  root += "/g" if Math.random() > 0.5 # greyscale kittens!
  return "#{root}/#{h}/#{w}"
