# Description:
#   Calculates the age
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot how old are you? #misc
#
# Author:
#   cpradio

DateDiff = {

  inDays: (d1, d2) ->
    t2 = d2.getTime();
    t1 = d1.getTime();

    return parseInt((t2-t1)/(24*3600*1000));
  ,

  inWeeks: (d1, d2) ->
    t2 = d2.getTime();
    t1 = d1.getTime();

    return parseInt((t2-t1)/(24*3600*1000*7));
  ,

  inMonths: (d1, d2) ->
    d1Y = d1.getFullYear();
    d2Y = d2.getFullYear();
    d1M = d1.getMonth();
    d2M = d2.getMonth();
    d1D = d1.getDate();
    d2D = d2.getDate();
    
    if d1D > d2D
        d2M -= 1;

    return (d2M+12*d2Y)-(d1M+12*d1Y);
  ,

  inYears: (d1, d2) ->
    d1Y = d1.getFullYear();
    d2Y = d2.getFullYear();
    d1M = d1.getMonth();
    d2M = d2.getMonth();
    
    if d1M > d2M
        d2Y -= 1;
    
    return d2Y-d1Y;
    
}


module.exports = (robot) ->
  robot.respond /how old are you\?/i, (msg) ->
    creation = new Date("March 12, 2015");
    today = new Date();
    
    in_years = DateDiff.inYears(creation, today);
    if (in_years > 0)
      creation.setFullYear(creation.getFullYear() + in_years);
      
    in_months = DateDiff.inMonths(creation, today);
    if (in_months > 0)
      creation.setMonth(creation.getMonth() + in_months);
      
    in_weeks = DateDiff.inWeeks(creation, today);
    if (in_weeks > 0)
      creation.setDate(creation.getDate() + (in_weeks * 7));
      
    in_days = DateDiff.inDays(creation, today);
    
    if (in_years > 1)
      in_years = "#{in_years} years "
    else if (in_years == 1)
      in_years = "#{in_years} year"
    else
      in_years = ""
      
    if (in_months > 1)
      in_months = "#{in_months} months"
    else if (in_months == 1)
      in_months = "#{in_months} month"
    else
      in_months = ""
      
    if (in_weeks > 1)
      in_weeks = "#{in_weeks} weeks"
    else if (in_weeks == 1)
      in_weeks = "#{in_weeks} week"
    else
      in_weeks = ""
      
    if (in_days > 1)
      in_days = "#{in_days} days"
    else if (in_days == 1)
      in_days = "#{in_days} day"
    else
      in_days = ""
    
    data = [in_years, in_months, in_weeks, in_days]
    
    output = ""
    while data.length > 0
      value = data.shift();
      if (value != "")
        output += value

        i = 0
        number_with_values = 0
        remaining = data.length
        while i < data.length
          if (data[i] != "")
            number_with_values++
          i++
           
        if (number_with_values > 1)
          output += ", "
        else if (number_with_values == 1)
          output += " and "
      
    msg.send "I am #{output} old."
