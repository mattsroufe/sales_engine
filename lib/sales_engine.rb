require 'csv'
require 'time'
require 'byebug'
require_relative 'sales_engine/merchant'
require_relative 'sales_engine/merchant_repository'
require_relative 'sales_engine/invoice_repository'
require_relative 'sales_engine/invoice'

class SalesEngine

  def startup
    true
  end

  def merchant_repository
    @merchant_repository ||= MerchantRepository.new
  end

  def invoice_repository
    @invoice_repository ||= InvoiceRepository.new
  end
end
