require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

sample = SlackNotify::Client.new(webhook_url: ENV["WEBHOOK"])
sample.notify("金曜日はカレー！:curry:", "#general")

module Clockwork
  handler do |job|
    client = SlackNotify::Client.new(webhook_url: ENV["WEBHOOK"])
    client.notify("３分タイマー :hourglass:")
  end
  every(3.minutes, 'less.frequent.job')
end
