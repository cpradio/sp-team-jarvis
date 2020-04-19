# Description:
#   pounds/kilograms Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot convert <weight> to lbs - convert <weight> to pounds #convert #conversion
#   hubot convert <weight>kg - convert <weight> to pounds #convert #conversion
#   hubot convert <weight> to kg - convert <weight> to kilograms #convert #conversion
#   hubot convert <weight>lbs - convert <weight> to kilograms #convert #conversion
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+) to lbs$/i, (msg) ->
    weight = msg.match[1]
    convertToPounds(msg, weight)

  robot.respond /convert ([\d\.]+)kg$/i, (msg) ->
    weight = msg.match[1]
    convertToPounds(msg, weight)

  robot.respond /convert ([\d\.]+) to kg$/i, (msg) ->
    weight = msg.match[1]
    convertToKilograms(msg, weight)

  robot.respond /convert ([\d\.]+)lbs$/i, (msg) ->
    weight = msg.match[1]
    convertToKilograms(msg, weight)

convertToPounds = (msg, weight) ->
    converted = parseFloat(weight) * 2.2
    msg.send "#{weight} kg is #{converted} lbs"

convertToKilograms = (msg, weight) ->
    converted = parseFloat(weight) / 2.2
    msg.send "#{weight} lbs is #{converted} kg"
