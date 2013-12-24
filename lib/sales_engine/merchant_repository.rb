class MerchantRepository
  attr_reader :all

  def initialize
    @all = parse_csv('data/merchants.csv')
  end

  def find_by_id(id)
    all.find { |merchant| merchant.id == id }
  end

  private

  def parse_csv(file)
    array = []
    CSV.foreach(file, :headers => true, :header_converters => :symbol) do |row|
      array << Merchant.new(row[:id], row[:name], row[:created_at], row[:updated_at])
    end
    array
  end
end
