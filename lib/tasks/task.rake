require 'sunspot/solr/tasks'


namespace :task do
  desc "Email via chron"

  task email: :environment do
    STDOUT.puts "Sending Email Via Chron........!"
    ChronMailer.information.deliver
  end
end


# cd /home/snmspace/apps/snmmaurya/current && RAILS_ENV=production rake task:email
# * * * * /bin/bash -l -c 'cd /Users/eugenewang/projects/rails/ticket_tracker && RAILS_ENV=development bundle exec rake events:fetch --silent >> log/cron_log.log 2>> log/cron_error_log.log'
