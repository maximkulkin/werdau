namespace :solr do
  task :start => :environment do
    server = Sunspot::Rails::Server.new
    begin
      server.start
      puts "Successfully started Solr"
    rescue Sunspot::Rails::Server::AlreadyRunningError => e
      puts e.to_s
    end
  end

  task :stop => :environment do
    server = Sunspot::Rails::Server.new
    begin
      server.stop
      puts "Successfully stopped Solr"
    rescue Sunspot::Rails::Server::NotRunningError => e
      puts e.to_s
    end
  end
end
