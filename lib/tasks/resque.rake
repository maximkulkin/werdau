# -*- encoding : utf-8 -*-

require 'resque/tasks'

ENV['RAILS_ENV'] ||= 'development'
ENV['QUEUE_TYPE'] ||= ENV['MAIL_QUEUES'] || '0'
ENV['QUEUE'] ||= begin
  case ENV['QUEUE_TYPE']
    when '1'
      'critical,critical_mail,high,high_mail,medium,medium_mail,backgrounded,low,low_mail'
    when '2'
      'critical_mail,high_mail,medium_mail,low_mail,critical,high,medium,backgrounded,low'
    else
      'critical,high,medium,backgrounded,low'
  end
end
ENV['COUNT'] ||= '1'
ENV['WORKER_NUM'] ||= '1'

RAILSROOT = File.expand_path('../../..', __FILE__)
PIDS_DIR = File.expand_path('tmp/pids', RAILSROOT)

def pid_name(num)
  "#{ENV['RAILS_ENV']}_resque_worker_#{num}.pid"
end

def pid_file(num)
  File.expand_path(File.join(PIDS_DIR, pid_name(num)))
end

def start_worker(num)
  stop_worker(num) # Kill old process
  %x(cd #{RAILSROOT}; nohup rake resque:work RAILS_ENV=#{ENV['RAILS_ENV']} QUEUE=#{ENV['QUEUE']} VERBOSE=1 PIDFILE=tmp/pids/#{pid_name(num)} >> log/#{ENV['RAILS_ENV']}_resque_worker_all.log < /dev/null 2>&1 &)
end

def stop_worker(num)
  pidfile = pid_file(num)
  %x(kill -s QUIT `cat #{pidfile}`; rm -f #{pidfile}; exit 0;) if File.exist?(pidfile)
end


namespace :resque do
  task :setup => :environment

  desc "Stop all resque workers"
  task :stop => :environment do
    Resque.workers.each do |worker|
      puts "Shutting down worker #{worker}"
      Process.kill("QUIT", worker.to_s.split(':').second.to_i)
    end
    %x(rm -f #{PIDS_DIR}/#{pid_name('*')}; exit 0;)
  end

  desc "Stop the resque worker"
  task :stop_worker do
    stop_worker(ENV['WORKER_NUM'])
  end

  desc "Start the resque workers"
  task :start_worker do
    start_worker(ENV['WORKER_NUM'])
  end

  desc "Start all resque workers"
  task :start do
    1.upto(ENV['COUNT'].to_i) { |i| start_worker(i) }
  end
end