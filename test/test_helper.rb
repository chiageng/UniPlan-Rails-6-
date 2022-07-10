ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user)
    post login_path, params: { session: {email: user.email, password: user.username} }
  end 

  def login(user)
    visit login_path 
    fill_in "email@example.com", with: user.email 
    fill_in "password", with: user.username 

    click_on "Log In"
  end 
end
