require 'csv'
require 'time'
require 'byebug'
require_relative 'sales_engine/repository'
require_relative 'sales_engine/repository_object'
require_relative 'sales_engine/merchant'
require_relative 'sales_engine/customer'
require_relative 'sales_engine/customer_repository'
require_relative 'sales_engine/merchant_repository'
require_relative 'sales_engine/invoice_repository'
require_relative 'sales_engine/invoice_item_repository'
require_relative 'sales_engine/item_repository'
require_relative 'sales_engine/item'
require_relative 'sales_engine/invoice'
require_relative 'sales_engine/invoice_item'

class SalesEngine

  def customer_repository
    @customer_repository ||= CustomerRepository.new(self)
  end

  def invoice_item_repository
    @invoice_item_repository ||= InvoiceItemRepository.new(self)
  end

  def invoice_repository
    @invoice_repository ||= InvoiceRepository.new(self)
  end

  def item_repository
    @item_repository ||= ItemRepository.new(self)
  end

  def merchant_repository
    @merchant_repository ||= MerchantRepository.new(self)
  end

  def startup
  end
end
