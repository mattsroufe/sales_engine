class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    MerchantRepository.instance.all << self
  end

  def invoices
    InvoiceRepository.instance.find_all_by_merchant_id(id)
  end
end
