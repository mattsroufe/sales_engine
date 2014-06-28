module Repository
  attr_reader :all

  def initialize
    @all = []
    @csv_data_loaded = false
  end

  def csv_data_loaded?
    @csv_data_loaded
  end

  def load_csv_data
    CSV.foreach(self.class::CSV_DATA_FILE, headers: true, header_converters: :symbol, converters: :integer) do |row|
      row[:created_at] = Time.parse(row[:created_at])
      row[:updated_at] = Time.parse(row[:updated_at])
      Object.const_get(self.class.to_s.gsub('Repository', '')).new(row)
    end unless csv_data_loaded?
    @csv_data_loaded = true
  end

  def random
    all.sample
  end

  def find_by_id(id)
    all.find { |object| object.id == id }
  end
end