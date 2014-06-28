class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @unit_price = args[:unit_price]
    @merchant_id = args[:merchant_id]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    ItemRepository.instance.all << self
  end
end
