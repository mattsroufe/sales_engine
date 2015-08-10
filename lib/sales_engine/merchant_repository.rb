class MerchantRepository < Repository

  CSV_DATA_FILE = 'data/merchants.csv'

  def find_by_name(name)
    detect { |merchant| merchant.name =~ /\A#{name}\z/i }
  end
end
