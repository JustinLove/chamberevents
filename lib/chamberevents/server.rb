require 'sinatra/base'

module Chamberevents
  class Server < Sinatra::Base
    get '/elginchamber-events.ics' do
      redirect "https://s3.amazonaws.com/#{ENV['S3_BUCKET']}/elginchamber-events.ics"
    end
  end
end
