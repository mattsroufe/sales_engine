require 'sales_engine'
require 'factory_girl'
require 'factories/merchants'
require 'factories/invoices'
require 'factories/items'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
