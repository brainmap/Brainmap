# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_JohnsonLabPublicSite_session',
  :secret      => '37afb3ae5a9c41fdb45fd935a99569961cd1bc68727b6c1996c36b5df0d31438b4f20ae24ef93675adcee7f6f92e8fb1f7cd62d8cc56f8a25cf40d4760137f37'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
