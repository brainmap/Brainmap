# A sample Gemfile
source "http://rubygems.org"

gem "rails", '~>2.3.9'
gem "RedCloth"
gem "sqlite3-ruby", :require => "sqlite3"
# This branch provides a hack to fix actual sending of emails. May be pulled into the official one later.
gem "exception_notification", :git => "https://github.com/vovik/exception_notification.git", :branch => '2-3-stable', :require => "exception_notification"
gem 'capistrano', '~>2.5.19'
gem 'paperclip', '~>2.3.8'
gem 'ruby-akismet', :require => 'akismet'

[:test, :cucumber].each do |group_name|
  group group_name do
    gem "cucumber-rails",    "~>0.3.2"
    gem "webrat",      "~>0.4.4" , :require => false
    gem "rspec",       "~>1.3.0" , :require => false
    gem "rspec-rails", "~>1.3.2"
    gem "database_cleaner", "~>0.5.0"
    gem "factory_girl", '~>1.2.4'
  end
end
