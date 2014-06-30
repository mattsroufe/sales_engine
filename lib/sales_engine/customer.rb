class Customer
  include SalesEngineFinder
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(args = {})
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @sales_engine_id = args[:sales_engine_id]
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
  end
end
