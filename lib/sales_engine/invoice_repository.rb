class InvoiceRepository
  include Repository

  CSV_DATA_FILE = 'data/invoices.csv'

  def create(args = {})
    Invoice.new(repository: self, id: customer_id: merchant_id:)
  end

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end
end
