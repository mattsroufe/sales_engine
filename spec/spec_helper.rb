SALES_ENGINE_ENV = 'test'

require 'sales_engine'
require 'factories/merchants'
require 'factories/customers'
require 'factories/invoices'
require 'factories/items'

def build(model_symbol, params = {})
  Object.const_get("Test#{model_symbol.to_s.split('_').map(&:capitalize).join}Factory").new.call(params)
end

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end
