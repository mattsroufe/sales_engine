require 'sales_engine'
require 'factory_girl'
require 'factories/merchants'
require 'factories/invoices'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) { SalesEngine.new }
end
