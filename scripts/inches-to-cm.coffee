# Description:
#   inches/centimeters Calculations
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot convert <length>(cm) to in(ches) - convert <length> centimeters to inches #convert #conversion
#   hubot convert <length>cm - convert <length> centimeters to inches #convert #conversion
#   hubot convert <length>(in|inches) to cm - convert <length> inches to centimeters #convert #conversion
#   hubot convert <length>in(ches) - convert <length> inches to centimeters #convert #conversion
#
# Author:
#   cpradio

module.exports = (robot) ->
  robot.respond /convert ([\d\.]+)\s?(cm)? to in(ches)?$/i, (msg) ->
    length = msg.match[1]
    convertToInches(msg, length)

  robot.respond /convert ([\d\.]+)\s?cm/i, (msg) ->
    length = msg.match[1]
    convertToInches(msg, length)

  robot.respond /convert ([\d\.]+)\s?(in(ches)?)? to cm/i, (msg) ->
    length = msg.match[1]
    convertToCentimeters(msg, length)

  robot.respond /convert ([\d\.]+)\s?in(ches)?$/i, (msg) ->
    length = msg.match[1]
    convertToCentimeters(msg, length)

convertToInches = (msg, length) ->
    converted = parseFloat(length) / 2.54
    msg.send "#{length} cm is #{converted} in"

convertToCentimeters = (msg, length) ->
    converted = parseFloat(length) * 2.54
    msg.send "#{length} in is #{converted} cm"
