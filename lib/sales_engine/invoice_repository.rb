class InvoiceRepository
  include Repository

  CSV_DATA_FILE = 'data/invoices.csv'

  def create(args = {})
    all << invoice = Invoice.new(
      customer_id: args[:customer].id,
      merchant_id: args[:merchant].id,
      status: args[:status],
      sales_engine_id: sales_engine_id,
      created_at: Time.now,
      updated_at: Time.now
    )
    args[:items].each do |item|
      invoice_item_repository.all << InvoiceItem.new(
        item_id: item.id,
        invoice_id: invoice.id,
        quantity: 1,
        unit_price: item.unit_price,
        sales_engine_id: sales_engine_id,
        created_at: Time.now,
        updated_at: Time.now
      )
    end
  end

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end
end
