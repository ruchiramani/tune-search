
require 'capybara/rspec'
require 'capybara-webkit'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.after(:all) do
      DatabaseCleaner.clean
    end
Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_url("i.scdn.co")
end

end
