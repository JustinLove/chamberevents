require 'icalendar2'

module Icalendar2
  module Property
    class Url < Base
      name "URL"
      value :types => [:text]
    end
  end
end

module ChamberEvents
  class Ical
    def initialize(events)
      @events = events
    end

    def to_s
      cal = Icalendar2::Calendar.new
      @events.each do |e|
        cal.event do
          summary e[:title]
          url e[:link]
          dtstart(e[:time_start] || e[:date])
          dtend(e[:time_end] || e[:date])
        end
      end

      cal.to_ical
    end
  end
end
