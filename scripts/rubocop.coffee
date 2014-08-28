# Description:
#   Rubocop protects the peace of the Code
#
# Dependencies:
#   None
#
# Configuration:
#   None

module.exports = (robot) ->
  robot.hear /(rubocop|robocop)/i, (msg) ->
    imageMe msg, "robocop", (url) ->
      msg.send url

imageMe = (msg, query, cb) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = msg.random images
        cb ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
