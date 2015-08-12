require 'delegate'

class Repository
  extend Forwardable

  attr_reader :sales_engine, :all

  def_delegators :@sales_engine, :customer_repository, :invoice_item_repository, :invoice_repository, :item_repository, :merchant_repository
  def_delegators :@all, :count, :[], :<<, :sample, :select, :detect, :find

  def initialize(sales_engine, data = File.read(self.class::CSV_DATA_FILE))
    @sales_engine = sales_engine
    @all = []
    load_csv_data(data)
  end

  def random
    sample
  end

  def find_by_id(id)
    find { |object| object.id == id }
  end

  def inspect
    ObjectSpace._id2ref(object_id).to_s
  end

  private

  def load_csv_data(data)
    CSV.parse(data, headers: true, header_converters: :symbol, converters: :integer) do |row|
      row[:created_at] = Time.parse(row[:created_at])
      row[:updated_at] = Time.parse(row[:updated_at])
      row[:repository] = self
      @all << Object.const_get(self.class.to_s.gsub('Repository', '')).new(row)
    end
  end
end
