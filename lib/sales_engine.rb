require 'csv'
require 'time'
require 'byebug'
require_relative 'sales_engine/merchant'
require_relative 'sales_engine/merchant_repository'
require_relative 'sales_engine/invoice_repository'
require_relative 'sales_engine/invoice'

class SalesEngine
  @@instance = nil

  def initialize
    raise 'SalesEngine instance already exists' unless @@instance.nil?
    @@instance = self
  end

  def self.instance
    @@instance
  end

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
