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
        dateparts = [2000 + date[2], date[0], date[1]]
        times = row.at_css('.time').content
        time = times.split(' - ').map {|t| parse_time(t)}
        e = {
          :title => title.content,
          :link => title[:href],
          :date => Date.new(*dateparts),
        }
        e[:time_start] = DateTime.new(*(dateparts + time[0])) if time[0] && !time[0].empty?
        e[:time_end]   = DateTime.new(*(dateparts + time[1])) if time[1] && !time[1].empty?
        e[:all_day] = times == 'All-day'
        e
      end
    end

    def parse_time(t)
      parts = t.gsub(/[^\d:]/, '').split(':').map(&:to_i)
      parts[0] += 12 if t.match('pm')
      parts
    end
  end
end
