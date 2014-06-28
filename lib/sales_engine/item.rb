class Item
  include SalesEngineFinder
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(args = {})
    repository = args[:repository] || ItemRepository.new
    @id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @unit_price = args[:unit_price]
    @merchant_id = args[:merchant_id]
    @sales_engine_id = repository.sales_engine_id
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    repository.all << self
  end
end
