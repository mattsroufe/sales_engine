class Merchant
  attr_reader :engine, :id, :name, :created_at, :updated_at

  def initialize(engine, id, name, created_at, updated_at)
    @engine = engine
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
  end

  def invoices
    engine.invoice_repository.find_all_by_merchant_id(id)
  end
end
