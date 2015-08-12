class Invoice < RepositoryObject
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(args = {})
    @repository      = args[:repository]
    @id              = args[:id]
    @customer_id     = args[:customer_id]
    @merchant_id     = args[:merchant_id]
    @status          = args[:status]
    @created_at      = args[:created_at]
    @updated_at      = args[:updated_at]
  end
end
