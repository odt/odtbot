# Description:
#  「つらい」というとわかってくれます。
module.exports = (robot) ->
  robot.hear /つらい/, (msg) ->
    msg.send 'わかる'
