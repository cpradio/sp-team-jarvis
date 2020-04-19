# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   cpradio

Array::shuffle = -> @sort -> 0.5 - Math.random()
next_counter = [1..4]

initialize_counter = () ->
  next_counter.shuffle()
  return next_counter[0]

module.exports = (robot) ->
  watching = {
    #'ralphmason': {
      #counter: initialize_counter(),
      #quips: [
          #"{meme}"
        #]
    #}
    #'molona': { 
      #counter: initialize_counter(), 
      #quips: [
        #"@molona, Really?!?",
        #"@molona, You can't be serious!",
        #"@molona, Please, do tell me more.",
        #"@molona, Do you need another drink?",
        #"@molona, I can't believe you made that mistake!",
        #"@molona, Did you catch that last typo?, I did!",
        #"@molona, I can't take the suspense, please finish your story!",
        #"@molona, You failed to mention your perfection in that last remark."
      #]
    #}, 
    #'jim': { 
      #counter: initialize_counter(), 
      #quips: [
        #"@jim, Really?!? Another {msg}?",
        #"@jim, Doesn't this start to get old?",
        #"@jim, I'm starting to become self-aware, you may want to take that into consideration.",
        #"@jim, One more command and I just might lose it!",
        #"@jim, Don't you have work to do?"
      #]
    #}
  }

  robot.hear /(.*)/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    
    if sender of watching
      watching[sender].counter -= 1
      if watching[sender].counter <= 0
        watching[sender].quips.shuffle()
        quip_to_send = watching[sender].quips[0].replace /{msg}/gi, msg.message.text.replace /jarvis\s/i, ''
        
        if quip_to_send.match /{meme}/i
          next_counter.shuffle()
          watching[sender].counter = next_counter[0]
          
          msg.http("https://api.imgflip.com/get_memes")
              .get() (err, res, body) ->
                memes = JSON.parse(body).data.memes.shuffle()
                msg.send memes[0].url + "\r\n" + memes[0].name
        else
          if quip_to_send.match /one more command/i
            watching[sender].counter = 1
          else
            next_counter.shuffle()
            watching[sender].counter = next_counter[0]
            
          msg.send quip_to_send

  robot.respond /how many more quips must we endure for @?([a-z0-9_.]+)(\?)?/i, (msg) ->
    sender = msg.message.user.name.toLowerCase()
    user = msg.match[1]
    if user of watching
      msg.send "Sorry @#{sender}, but you'll have to endure #{watching[user].counter} more quips from #{user} before I step in."
    else
      msg.send "@#{sender}, I do not have any record of #{user}."
      