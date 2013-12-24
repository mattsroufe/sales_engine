require 'csv'
require 'sales_engine/merchant'
require 'sales_engine/merchant_repository'

class SalesEngine
  attr_reader :merchant_repository

  def initialize
    @merchant_repository = MerchantRepository.new
  end
end
