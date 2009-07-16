default_run_options[:pty] = true
ssh_options[:paranoid] = false

set :application, "Brainmap"
set :host_server, "pepe.medicine.wisc.edu"
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
    run "cp #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "rm -rf #{release_path}/config/database.yml"
    run "rm -rf #{release_path}/images/*"
    
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/images #{release_path}/public/images"
    run "ln -nfs #{release_path}/db/production.sqlite3 #{shared_path}/db/production.sqlite3"
  end
  
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  # task :migrate
end

after 'deploy:symlink', 'deploy:symlink_shared'