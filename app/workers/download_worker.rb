class UserDownloadWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(options={})
    download = options["download"]
  end
end

=begin
#Async performs job as just possible
HardWorker.perform_async('data', 5)
#Async performs job just after 5 minutes
HardWorker.perform_in(5.minutes, 'data', 5)
=end