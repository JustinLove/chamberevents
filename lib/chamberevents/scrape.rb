require 'nokogiri'

module ChamberEvents
  class Scrape
    def initialize(html)
      @doc = Nokogiri.HTML(html)
    end

    attr_reader :doc

    def events
      doc.css('.event').map do |row|
        title = row.at_css('a')
        date = row.at_css('.date').content.split('.').map(&:to_i)
        times = row.at_css('.time').content
        time = times.split(' - ').map {|t| parse_time(t)}
        e = {
          :title => title.content,
          :link => title[:href],
          :date => Date.new(2000 + date[2], date[0], date[1]),
        }
        e[:time_start] = time[0] if time[0] && !time[0].empty?
        e[:time_end] = time[1] if time[1] && !time[1].empty?
        e[:all_day] = times == 'All-day'
        e
      end
    end

    def parse_time(t)
      if t.match('pm')
        (t.gsub(/\D/, '').to_i + 1200).to_s
      else
        t.gsub(/\D/, '')
      end
    end
  end
end
