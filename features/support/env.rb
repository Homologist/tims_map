require 'coveralls'
Coveralls.wear_merged!("rails")

require 'simplecov'
require 'cucumber/rails'
require 'etc'
require 'pp'

require 'cucumber/rspec/doubles'
require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  options = {
      :js_errors => false,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=true'],
      :inspector => true,
      :phantomjs => Phantomjs.path
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
