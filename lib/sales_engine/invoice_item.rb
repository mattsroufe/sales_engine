class InvoiceItem
  include SalesEngineFinder
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(repository: InvoiceItemRepository.new, **args)
    @id = repository.all.count + 1
    @item_id = args[:item_id]
    @invoice_id = args[:invoice_id]
    @quantity = args[:quantity]
    @unit_price = args[:unit_price]
    @sales_engine_id = repository.sales_engine_id
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    repository.all << self
  end
end
