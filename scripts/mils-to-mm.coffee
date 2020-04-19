# Description:
#   thou of an inch/millimeters Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot convert <length>(mm) to (thou|mil|mils) - convert <length> millimeters to thou of an inch #convert #conversion
#   hubot convert <length>mm - convert <length> millimeters to thou of an inch #convert #conversion
#   hubot convert <length>(thou|mil|mils) to mm - convert <length> thou of an inch to millimeters #convert #conversion
#   hubot convert <length>(thou|mil|mils) - convert <length> thou of an inch to millimeters #convert #conversion
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+)\s?(mm)? to (thou|mil|mils)$/i, (msg) ->
    length = msg.match[1]
    convertToThou(msg, length)

  robot.respond /convert ([\d\.]+)\s?mm/i, (msg) ->
    length = msg.match[1]
    convertToThou(msg, length)

  robot.respond /convert ([\d\.]+)\s?(thou|mil|mils)? to mm/i, (msg) ->
    length = msg.match[1]
    convertToMillimeters(msg, length)

  robot.respond /convert ([\d\.]+)\s?(thou|mil|mils)$/i, (msg) ->
    length = msg.match[1]
    convertToMillimeters(msg, length)

convertToThou = (msg, length) ->
    converted = parseFloat(length) / 0.0254
    msg.send "#{length} mm is #{converted} mils"

convertToMillimeters = (msg, length) ->
    converted = parseFloat(length) * 0.0254
    msg.send "#{length} mils is #{converted} mm"
