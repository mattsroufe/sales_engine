require 'csv'
require 'time'
require 'byebug'
require_relative 'sales_engine/modules/sales_engine_finder'
require_relative 'sales_engine/repository'
require_relative 'sales_engine/merchant'
require_relative 'sales_engine/customer'
require_relative 'sales_engine/customer_repository'
require_relative 'sales_engine/merchant_repository'
require_relative 'sales_engine/invoice_repository'
require_relative 'sales_engine/item_repository'
require_relative 'sales_engine/item'
require_relative 'sales_engine/invoice'

class SalesEngine
  attr_reader :repositories

  REPOSITORIES = [MerchantRepository, InvoiceRepository, ItemRepository, CustomerRepository]

  REPOSITORIES.each do |klass|
    define_method(klass.to_s.scan(/[A-Z][a-z]*/).join('_').downcase) do
      repositories.detect { |repository| repository.class == klass }
    end
  end

  def initialize
    @repositories = []
    REPOSITORIES.each do |klass|
      klass.new(self)
    end
  end

  def startup
    repositories.each do |repository|
      repository.load_csv_data
    end
  end
end
