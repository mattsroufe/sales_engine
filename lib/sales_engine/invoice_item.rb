class InvoiceItem
  include SalesEngineFinder
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(args = {})
    @id = args[:id]
    @item_id = args[:item_id]
    @invoice_id = args[:invoice_id]
    @quantity = args[:quantity]
    @unit_price = args[:unit_price]
    @sales_engine_id = args[:sales_engine_id]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
  end
end