class Invoice
  include SalesEngineFinder
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(repository: InvoiceRepository.new, **args)
    @id = repository.all.count + 1
    @customer_id = args[:customer_id]
    @merchant_id = args[:merchant_id]
    @status = args[:status]
    @sales_engine_id = repository.sales_engine_id
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    repository.all << self
  end
end
