class MerchantRepository < Repository

  def find_by_name(name)
    detect { |merchant| merchant.name =~ /\A#{name}\z/i }
  end
end
