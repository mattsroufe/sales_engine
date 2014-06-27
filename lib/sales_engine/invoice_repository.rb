class InvoiceRepository
  include Singleton
  include Repository

  CSV_DATA_FILE = 'data/invoices.csv'

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end
end
