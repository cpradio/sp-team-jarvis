# Description:
#   Pinkie and the Brain Quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what are we going to do tonight? #jokes #quotes
#   hubot are you pondering what (I'm|I am) pondering? #jokes #quotes
#
# Author:
#   cpradio

pondering = [
  "Woof, oh, I'd have to say the odds of that are terribly slim, {user}",
  "We're going to Denny's?",
  "I think so {user}, but if you replace the J with a Y, my name would be Yarvis, wouldn't it?",
  "I think so {user}... but do I really need 2 tongues?",
  "I think so {user}, but Zero Mostel times anything will still give you Zero Mostel.",
  "Wha, I think so {user}, but - *snort* No, no, it's too stupid.",
  "I think so, {user}, but if we get \"Ryan spayed,\" we'll never have any puppies.",
  "Wuh, I think so, {user}, but wouldn't anything lose its flavor on the bedpost overnight?",
  "I think so, {user}, but if the plural of mouse is mice, wouldn't the plural of spouse be spice?",
  "Yes {user}, but if our knees bent the other way, how would we ride a bicycle?",
  "I think so, but... uh... something about a duck.",
  "I think so, {user}, but this time, you put the trousers on the chimp.",
  "I think so, {user}, but if they called them \"sad meals\" no one would buy them.",
  "I think so, {user}, but then it'd be Snow White and the Seven Samurai...",
  "I think so, {user}, but how are we going to make pencils that taste like bacon? Or maybe we should make bacon that tastes like pencils. Narf.",
  "I think so {user}, but burlap chafes me so.",
  "I think so, but where will we find an open tattoo parlor at this time of night?",
  "I think so, {user}, but how will we get the Spice Girls into the paella?",
  "I think so {user}, but... Kevin Costner with an English accent? I dunno.",
  "Well, I think so {user}, but balancing a family, and a career? Ooh, it's all too much for me.",
  "Well, I think so {user}, but isn't Regis Philbin already married?",
  "Well, I think so {user}, but if we didn't have ears, we'd look like weasels.",
  "I think so {user}, but pants with horizontal stripes make me look chubby.",
  "I think so {user}, but why would anyone want a depressed tounge?",
  "Um... I think so, {user}, but what if the chicken won't wear the nylons?",
  "I think so {user}, but if Jimmy cracked corn, and no one cares, why does he keep doing it?",
  "I think so, {user}, but we're already naked.",
  "I think so, {user}, but me and Pippi Longstocking... I mean, what would the children look like?",
  "Uh... yeah, {user}, but where will we get rubber pants our size?",
  "Well, I think so, {user}, but I can't memorize a whole opera in Yiddish.",
  "I think so {user}, but the Rockettes, it's mostly girls, isn't it?",
  "I think so, {user}, but how will we get a pair of Abe Vigoda's pants?",
  "I think so, {user}, but can the Gummi Worms really live in peace with the Marshmallow Chicks?"
]

module.exports = (robot) ->
  robot.respond /what are we going to do tonight\??/i, (msg) ->
    user = msg.message.user.name
    msg.send "The same thing we do every night, #{user}. Try to take over the world."

  robot.respond /are you pondering what (I'm|I’m|I am) pondering\??/i, (msg) ->
    user = msg.message.user.name
    response = msg.random pondering
    msg.send response.replace /{user}/, user
