module Repository
  include SalesEngineFinder
  attr_reader :sales_engine_id, :all

  def initialize(sales_engine_id = nil)
    @sales_engine_id = sales_engine_id
    @all = []
  end

  def load_csv_data
    CSV.foreach(self.class::CSV_DATA_FILE, headers: true, header_converters: :symbol, converters: :integer) do |row|
      row[:created_at] = Time.parse(row[:created_at])
      row[:updated_at] = Time.parse(row[:updated_at])
      row[:sales_engine_id] = self.sales_engine_id
      all << Object.const_get(self.class.to_s.gsub('Repository', '')).new(row)
    end
    @csv_data_loaded = true
  end

  def random
    all.sample
  end

  def find_by_id(id)
    all.find { |object| object.id == id }
  end
end
