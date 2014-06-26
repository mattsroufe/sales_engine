class MerchantRepository < Repository
  include Singleton

  attr_reader :all

  def initialize
    @all = []
    @csv_data_loaded = false
  end

  def find_by_name(name)
    @all.detect { |merchant| merchant.name =~ /\A#{name}\z/i }
  end

  def csv_data_loaded?
    @csv_data_loaded
  end

  def load_csv_data
    CSV.foreach('data/merchants.csv', :headers => true, :header_converters => :symbol, :converters => :integer) do |row|
      Merchant.new(row[:id], row[:name], Time.parse(row[:created_at]), Time.parse(row[:updated_at]))
    end unless csv_data_loaded?
    @csv_data_loaded = true
  end
end
