class InvoiceRepository < Repository

  CSV_DATA_FILE = 'data/invoices.csv'

  def create(args = {})
    all << invoice = Invoice.new(
      reposoitory: self,
      customer_id: args[:customer].id,
      merchant_id: args[:merchant].id,
      status:      args[:status],
      created_at:  Time.now,
      updated_at:  Time.now
    )
    args[:items].each do |item|
      invoice_item_repository.all << InvoiceItem.new(
        repository: invoice_item_repository,
        item_id:    item.id,
        invoice_id: invoice.id,
        quantity:   1,
        unit_price: item.unit_price,
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end
end
