require_relative "./../to_do_app"
require "capybara/rspec"
require "database_cleaner"
ENV["RACK_ENV"] = "test"

Capybara.app = ToDoApp

RSpec.configure do |config|

  config.before(:suite) do
    GschoolDatabaseConnection::DatabaseConnection.establish(ENV["RACK_ENV"])
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end


def register_and_sign_in(name, password)

  click_link "Register"

  fill_in "Username", with: name
  fill_in "Password", with: password

  click_button "Register"

  fill_in "Username", with: name
  fill_in "Password", with: password

  click_button "Sign In"

end

def create_a_to_do(description)
  fill_in "What do you need to do?", with: description
  click_button "Add ToDo"
end