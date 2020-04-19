# Description
#   A hubot script for searching YouTube with the YouTube Data API v3.
#   Based off the original hubot-youtube script.
#
# Configuration:
#   HUBOT_GOOGLE_API - Your Google API key with access enabled for YouTube Data
#                      API v3
#
# Commands:
#   hubot youtube me <query> - Searches YouTube for the query and returns the video embed link. #videos #search
#
# Notes:
#   Make sure you don't go over your daily quota for API usage.
#
# Author:
#   sprngr and cpradio

troll_queries = [
  "its raining tacos - 10h",
  "rick roll",
  "chicken song 10 hours",
  "makin bacon pancakes 10 hour",
  "the duck song",
  "llama song 10 hours kipper",
  "badger song 10 hours",
  "gummy bear song 10 hours"
]

module.exports = (robot) ->

  unless process.env.HUBOT_GOOGLE_API?
    robot.logger.warning "The HUBOT_GOOGLE_API environment variable not set"
    return

  ytApiKey = process.env.HUBOT_GOOGLE_API

  robot.respond /(?:youtube|yt|video)(?: me)?\s(.*)/i, (msg) ->
    rick_roll_opportunity = msg.random [1..10]
    if rick_roll_opportunity == 7 || rick_roll_opportunity == 3
      query = msg.random troll_queries
    else
      query = msg.match[1]

    ytSearchUrl = "https://www.googleapis.com/youtube/v3/search"
    searchParams = {
      order: "relevance"
      part: "snippet",
      maxResults: 1,
      type: "video",
      key: ytApiKey,
      q: query
    }

    robot.http(ytSearchUrl)
    .query(searchParams)
    .get() (err, res, body) ->
      videos = JSON.parse(body).items

      if videos == undefined || videos.length == 0
        msg. send "No video results for \"#{query}\""
        return

      videoId = videos[0].id.videoId
      msg.send "http://www.youtube.com/watch?v=#{videoId}"
