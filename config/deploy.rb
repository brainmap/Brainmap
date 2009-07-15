set :application, "JohnsonLabPublicSite"
set :repository,  "/Users/kjklocal/code/JohnsonLabPublicSite"
set :scp, :git

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "pepe.medicine.wisc.edu"
role :web, "pepe.medicine.wisc.edu"
role :db,  "pepe.medicine.wisc.edu", :primary => true

set :deploy_to, "/var/www/html/JohnsonLabPublicSite_test_deployment"


#############################################################
#	Application
#############################################################

set :application, "example"
set :deploy_to, "/var/www/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, true

#############################################################
#	Servers
#############################################################

set :user, "jim"
set :domain, "example.com"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Subversion
#############################################################

set :repository,  "http://www.example.com/svn/example"
set :svn_username, "jim"
set :svn_password, "password"
set :checkout, "export"

#############################################################
#	Passenger
#############################################################

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"