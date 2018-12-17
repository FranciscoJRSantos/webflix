require 'database_cleaner'

DatabaseCleaner.allow_remote_database_url = true
# DatabaseCleaner.url_whitelist = ['postgres://postgres@postgres', 'postgres://postgres@postgres:5432']

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
