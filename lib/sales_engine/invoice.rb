class Invoice
  include SalesEngineFinder
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(args = {})
    @id = args[:id]
    @customer_id = args[:customer_id]
    @merchant_id = args[:merchant_id]
    @status = args[:status]
    @sales_engine_id = args[:sales_engine_id]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
  end
end
