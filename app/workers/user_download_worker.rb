require 'csv'

class UserDownloadWorker

  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(options={})
    download = Download.find options["download_id"]
    filename = "#{Rails.root}/public/downloads/#{download.download}"
    CSV.open(filename, 'w') do |writer|
      writer << ["id", "username", "email", "created_at"]
      User.all.each do |user|
        writer << [user.id, user.username, user.email, user.created_at]
      end
    end
    download.status=true
    download.save!
  end

end

=begin
#Async performs job as just possible
HardWorker.perform_async('data', 5)
#Async performs job just after 5 minutes
HardWorker.perform_in(5.minutes, 'data', 5)


bundle exec sidekiq -q high,5 default,1
=end