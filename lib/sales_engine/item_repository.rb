class ItemRepository < Repository

  def find_all_by_merchant_id(merchant_id)
    all.select { |item| item.merchant_id == merchant_id }
  end
end
