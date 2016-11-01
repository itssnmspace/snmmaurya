namespace :sunspotsolrsearch do

  desc "start/stop/restart/reindex"

  task stop: :environment do
    STDOUT.puts "Stoping sunspot solr search"
    begin
      Rake::Task['sunspot:solr:stop'].invoke
      # Rake::Task['reklamer:orville'].invoke(args)
      # system("rake db:test:reset RAILS_ENV=test")
    rescue Exception => e
      STDOUT.puts " ------- Unable to stop because of: #{e.message}"
    end
  end

  task start: :environment do
    STDOUT.puts "Starging sunspot solr search"
    begin
      Rake::Task['sunspot:solr:start'].invoke
    rescue Exception => e
      STDOUT.puts " ------- Unable to start because of: #{e.message}"
    end
  end


  task restart: :environment do
    STDOUT.puts "Restarting sunspot solr search"
    begin
      Rake::Task['sunspot:solr:restart'].invoke
    rescue Exception => e
      STDOUT.puts " ------- Unable to restart because of: #{e.message}"
    end
  end


  task reindex: :environment do
    STDOUT.puts "Reindexing sunspot solr search"
    begin
      Rake::Task['sunspot:solr:reindex'].invoke
    rescue Exception => e
      STDOUT.puts " ------- Unable to reindex because of: #{e.message}"
    end
  end
end