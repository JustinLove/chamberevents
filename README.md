# Chamberevents

Scrape the [Elgin Chamber](http://elginchamber.com/) [events](http://elginchamber.com/events) site and produce an ical feed that can be used by other applications.

## Installation

Add this line to your application's Gemfile:

    gem 'chamberevents'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chamberevents

## Usage

Primarily intended to run as a herkou app, but the sinatra server is modular, and really just a redirect.  The work is done by a rake task calling the gem, which uploads a file to S3.

    $ rake update

The gem requires a few ENV variables to work properly:

- `AWS_KEY`
- `AWS_SECRET`
- `S3_BUCKET`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
