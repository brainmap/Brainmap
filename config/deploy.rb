require 'bundler/capistrano'

default_run_options[:pty] = true
ssh_options[:paranoid] = false

set :application, "Brainmap"
set :host_server, "mojo.medicine.wisc.edu"
role :app, host_server
role :web, host_server
role :db,  host_server, :primary => true

set :user, "deployer"
set :deploy_to, "/var/www/html/#{application}"

set :scm, "git"
set :repository, "git@github.com:brainmap/Brainmap.git"
set :branch, "master"

namespace :deploy do
  # task :update_code
  
  # task :symlink
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "rm -rf #{release_path}/public/assets"
    run "cp #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "rm -rf #{release_path}/config/database.yml"
    #run "rm -rf #{release_path}/images/*"
    
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/initializers/akismet.rb #{release_path}/config/initializers/akismet.rb"
    run "ln -nfs #{release_path}/db/production.sqlite3 #{shared_path}/db/production.sqlite3"

    #run "ln -nfs #{shared_path}/images #{release_path}/public/images"
  end
  
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  # task :migrate
end

after 'deploy:symlink', 'deploy:symlink_shared'
after 'deploy:migrate', 'deploy:restart'