class ItemRepository < Repository

  CSV_DATA_FILE = 'data/items.csv'

  def find_all_by_merchant_id(merchant_id)
    all.select { |item| item.merchant_id == merchant_id }
  end
end
