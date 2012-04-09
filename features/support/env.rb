require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'capybara-page-object'
  require 'cucumber/rails'

  Capybara.default_selector = :css
  DatabaseCleaner.strategy = :truncation # since I don't think Sqlite supports transactions (TODO check this)
  Cucumber::Rails::Database.javascript_strategy = :truncation
end

Spork.each_run do
end
