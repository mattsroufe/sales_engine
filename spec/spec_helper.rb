require 'sales_engine'
require 'factory_girl'
require 'factories/sales_engines'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) { FactoryGirl.build(:sales_engine) }
end
