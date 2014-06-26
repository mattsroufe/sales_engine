class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(id, name, created_at, updated_at)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    MerchantRepository.instance.all << self
  end

  def invoices
    InvoiceRepository.instance.find_all_by_merchant_id(id)
  end
end
