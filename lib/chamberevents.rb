require "chamberevents/version"
require 'chamberevents/read'
require 'chamberevents/ical'
require 'chamberevents/upload'

module Chamberevents
  def self.update!
    events = Read.current
    ical = Ical.new(events).to_s
    Upload.write('elginchamber-events.ics', ical)
  end
end
