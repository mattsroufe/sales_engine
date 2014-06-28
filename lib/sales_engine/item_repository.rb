class ItemRepository
  include Singleton
  include Repository

  CSV_DATA_FILE = 'data/items.csv'
end
