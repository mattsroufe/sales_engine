class MerchantRepository

  def initialize(merchants = [])
    @file_path = file_path
  end

  def all
    @all ||= [].tap do |arr|
      if @file_path
        CSV.parse(File.read(@file_path), headers: true, header_converters: :symbol, converters: :integer) do |row|
          row[:created_at] = Time.parse(row[:created_at])
          row[:updated_at] = Time.parse(row[:updated_at])
          arr << Merchant.new(row.to_h)
        end
      end
    end
  end
end
