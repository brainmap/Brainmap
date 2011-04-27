# A sample Gemfile
source "http://rubygems.org"

gem "rails", '2.3.8'
gem "RedCloth"
gem "sqlite3-ruby", :require => "sqlite3"

[:test, :cucumber].each do |group_name|
  group group_name do
    gem "cucumber",    ">=0.3.91", :require => false
    gem "webrat",      ">=0.4.4" , :require => false
    gem "rspec",       ">=1.2.6" , :require => false
    gem "rspec-rails", ">=1.2.6", :require => 'spec/rails'
    gem "factory_girl", :require    => "factory_girl"
  end
end