require 'sunspot/solr/tasks'


namespace :task do
  desc "Email via chron"

  task email: :environment do
    STDOUT.puts "Sending Email Via Chron........!"
    ChronMailer.information.deliver
  end
end