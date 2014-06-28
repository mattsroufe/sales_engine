require 'csv'
require 'time'
require 'byebug'
require 'singleton'
require_relative 'sales_engine/repository'
require_relative 'sales_engine/merchant'
require_relative 'sales_engine/merchant_repository'
require_relative 'sales_engine/invoice_repository'
require_relative 'sales_engine/item_repository'
require_relative 'sales_engine/item'
require_relative 'sales_engine/invoice'

class SalesEngine
  @@instance = nil

  REPOSITORIES = [MerchantRepository, InvoiceRepository, ItemRepository]

  REPOSITORIES.each do |repository|
    define_method(repository.to_s.scan(/[A-Z][a-z]*/).join('_').downcase) { repository.instance }
  end

  def initialize
    raise 'SalesEngine instance already exists' unless @@instance.nil?
    @@instance = self
  end

  def self.instance
    @@instance
  end

  def startup
    REPOSITORIES.each do |repository|
      repository.instance.load_csv_data
    end
  end
end
