require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
# require 'selenium-webdriver'


Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :css

module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)

# Capybara.register_driver :selenium do |app|
# profile = Selenium::WebDriver::Chrome::Profile.new
# profile["download.default_directory"] = Dir.pwd
# Capybara::Selenium::Driver.new(app, :browser => :chrome , :profile => profile)
# end
# Capybara.default_driver = :selenium
