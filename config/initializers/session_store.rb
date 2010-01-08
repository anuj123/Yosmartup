# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_getsetgo_session',
  :secret      => '1784118f7dc9c39b5c364d579a3fe4db0ca13fbee3b2fc2bbf487d8c8537219122f60c5d43cf262d64870688d1618463a5b16df214a137e745b91c6769448fdd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
