require 's3'

module Chamberevents
  module Upload
    extend self

    def write(name, content)
      s3 = S3::Service.new(:access_key_id => ENV['AWS_KEY'],
                           :secret_access_key => ENV['AWS_SECRET'])
      bucket = s3.buckets.find(ENV['S3_BUCKET'])
      object = bucket.objects.build(name)
      object.content = content
      object.save
    end
  end
end
