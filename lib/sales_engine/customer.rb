class Customer
  include SalesEngineFinder
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(args = {})
    repository = args[:repository] || CustomerRepository.new
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @sales_engine_id = repository.sales_engine_id
    @created_at = args[:created_at]
    @updated_at = args[:updated_at]
    repository.all << self
  end
end
