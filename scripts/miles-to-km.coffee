# Description:
#   miles/kilometers Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot convert <distance>(km) to mi(les) - convert <distance> kilometers to miles #convert #conversion
#   hubot convert <distance>km - convert <distance> kilometers to miles #convert #conversion
#   hubot convert <distance>(mi|miles) to km - convert <distance> miles to kilometers #convert #conversion
#   hubot convert <distance>mi(les) - convert <distance> miles to kilometers #convert #conversion
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+)\s?(km)? to mi(les)?$/i, (msg) ->
    distance = msg.match[1]
    convertToMiles(msg, distance)

  robot.respond /convert ([\d\.]+)\s?km$/i, (msg) ->
    distance = msg.match[1]
    convertToMiles(msg, distance)

  robot.respond /convert ([\d\.]+)\s?(mi(les)?)? to km$/i, (msg) ->
    distance = msg.match[1]
    convertToKilometers(msg, distance)

  robot.respond /convert ([\d\.]+)\s?mi(les)?$/i, (msg) ->
    distance = msg.match[1]
    convertToKilometers(msg, distance)

convertToMiles = (msg, distance) ->
    converted = parseFloat(distance) * 0.62137
    msg.send "#{distance} km is #{converted} mi"

convertToKilometers = (msg, distance) ->
    converted = parseFloat(distance) / 0.62137
    msg.send "#{distance} mi is #{converted} km"
