require 'open-uri'
require 'chamberevents/scrape'

module Chamberevents
  module Read
    extend self

    def page(uri)
      Scrape.new(open(uri).read).events
    end

    def current
      now = Date.today
      next_month = now << 1
      page(url(now)) + page(url(next_month))
    end

    def url(time)
      time.strftime("http://elginchamber.com/events/month/%Y/%m/")
    end
  end
end
