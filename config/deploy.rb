require 'bundler/capistrano'

load 'deploy/assets'

# Авторизацию SSH по ключу.
ssh_options[:forward_agent] = true

# Имя вашего проекта в панели управления.
# Не меняйте это значение без необходимости, оно используется дальше.
set :application,     "werdau"

# Сервер размещения проекта.
set :deploy_server,   "88.198.200.69"

# Не включать в поставку разработческие инструменты и пакеты тестирования.
set :bundle_without,  [:development, :test]

set :user,            "root"
set :use_sudo,        true
set :deploy_to,       "/var/www/#{application}"

set :bundle_dir,      File.join(fetch(:shared_path), 'gems')

set :shared_children, shared_children + %w{public/spree solr}

role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true


# Следующие строки необходимы, т.к. ваш проект использует rvm.


set :scm,             :git
set :repository,    "git://github.com/maximkulkin/werdau.git"


namespace :db do

  desc <<-DESC
    Creates the database.yml configuration file in shared path.

    By default, this task uses a template unless a template
    called database.yml.erb is found either is :template_dir
    or /config/deploy folders. The default template matches
    the template for config/database.yml file shipped with Rails.

    When this recipe is loaded, db:setup is automatically configured
    to be invoked after deploy:setup. You can skip this task setting
    the variable :skip_db_setup to true. This is especially useful
    if you are using this recipe in combination with
    capistrano-ext/multistaging to avoid multiple db:setup calls
    when running deploy:setup for all stages one by one.
  DESC
  task :setup, :except => { :no_release => true } do

    default_template = <<-EOF
    base: &base
      adapter: sqlite3
      timeout: 5000
    development:
      database: #{shared_path}/db/development.sqlite3
      <<: *base
    test:
      database: #{shared_path}/db/test.sqlite3
      <<: *base
    production:
      database: #{shared_path}/db/production.sqlite3
      <<: *base
    EOF

    location = fetch(:template_dir, "config") + '/database.yml.erb'
    template = File.file?(location) ? File.read(location) : default_template

    config = ERB.new(template)

    run "mkdir -p #{shared_path}/db"
    run "mkdir -p #{shared_path}/config"
    put config.result(binding), "#{shared_path}/config/database.yml"
  end

  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  after "deploy:setup", "db:setup" unless fetch(:skip_db_setup, false)
  after "deploy:finalize_update", "db:symlink"
end


set :rvm_ruby_string, "ruby-1.9.3-p125"
set :rvm_type, :system

require 'rvm/capistrano'

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'


set :unicorn_config,  "#{current_path}/config/unicorn.rb"
set :unicorn_pid,     "#{shared_path}/pids/unicorn.pid"
require 'capistrano/ext/rvm-unicorn'

namespace :unicorn do
  task :setup do
    default_template = <<-EOS
    EOS

    location = fetch(:template_dir, "config") + '/unicorn.rb.erb'
    template = File.file?(location) ? File.read(location) : default_template

    config = ERB.new(template)

    run "mkdir -p #{shared_path}/config"
    put config.result(binding), "#{shared_path}/config/unicorn.rb"
  end

  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/unicorn.rb #{release_path}/config/unicorn.rb"
  end

  after "deploy:setup", "unicorn:setup"
  after "deploy:finalize_update", "unicorn:symlink"
end

namespace :solr do
  task :start, :role => :app do
    run "cd #{current_path} && rvm '#{rvm_ruby_string}' && bundle exec rake RAILS_ENV=production sunspot:solr:start"
  end

  task :stop, :role => :app do
    run "cd #{current_path} && rvm '#{rvm_ruby_string}' && bundle exec rake RAILS_ENV=production sunspot:solr:stop"
  end

  task :restart, :role => :app do
    stop
    start
  end

  task :reindex, :role => :app do
    run "cd #{current_path} && rvm '#{rvm_ruby_string}' && bundle exec rake RAILS_ENV=production sunspot:reindex[100,Spree::Product]"
  end
end

before 'deploy:start',   'solr:start'
after  'deploy:stop',    'solr:stop'
  
namespace :deploy do
  desc "Start unicorn server"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && rvm '#{rvm_ruby_string}' && bundle exec unicorn_rails -c #{unicorn_config} -E #{rails_env} -D"
  end

  desc "Stop unicorn server"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "[ -e #{unicorn_pid} -a -e /proc/`cat #{unicorn_pid}` ] && kill -TERM `cat #{unicorn_pid}`; true"
  end
end
 
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
