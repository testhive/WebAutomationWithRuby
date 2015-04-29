#encoding: UTF-8
require 'capybara'
require 'rspec'
require 'rest-client'
require 'mysql'
require 'mongo'
require 'spreadsheet'
include Mongo

$screenshot_counter = 0
Capybara.save_and_open_page_path = File.expand_path(File.join(File.dirname(__FILE__), "../../screenshots/"))

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

Capybara.app_host = "http://www.tureng.com"

Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_wait_time = 10  #default wait time for ajax
Capybara.ignore_hidden_elements = false
Capybara.exact = true

World(Capybara::DSL)
