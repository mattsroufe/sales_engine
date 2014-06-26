class MerchantRepository < Repository
  include Singleton

  def all
    @all ||= parse_csv('data/merchants.csv')
  end

  private

  def parse_csv(file)
    CSV.read(file, :headers => true, :header_converters => :symbol, :converters => :integer).map do |row|
      Merchant.new(row[:id], row[:name], Time.parse(row[:created_at]), Time.parse(row[:updated_at]))
    end
  end
end
