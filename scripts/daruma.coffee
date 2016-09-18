# coffeelint: disable=max_line_length

moment = require 'moment'
require 'moment-precise-range-plugin'
moment.locale 'ja'
cron = require('cron').CronJob
envelope = room: "C2CPKV7K9" # general
mode = 'normal'

module.exports = (robot) ->

  # error handling
  robot.error (err, res) ->
    robot.logger.error err
    robot.logger.error res

  # startup
  msgs = [
    'すべての人が、道を知っている。わずかな人だけ、道を歩いている。',
    '心に、差別なきことを、正と言い、心が、差別をすることを、邪と言う',
    '求めること有れば　皆、苦であり、求めること無ければ、皆、楽である。',
    '気は長く、心は丸く、腹を立てず、人は大きく、己は小さく'
  ]
  message = msgs[Math.floor(Math.random() * msgs.length)] || ''
  robot.send envelope, message
  robot.send envelope, "禅の道まで　あと#{moment.preciseDiff(moment.utc().startOf('date'), moment.utc('2016-10-01 00:00:00'), true).days}日\n"
