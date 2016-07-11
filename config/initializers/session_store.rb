# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bazooka_session',
  :secret      => '36d5b135cfad6e515218c65a2a106275c5446e079655a2d31523e9b65fd0123d2494d2cfe8ce554ea579ebb849a1e77440362009eff3edb585d0cda0d8003a89'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
