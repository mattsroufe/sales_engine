class InvoiceRepository

  def all
    @all ||= parse_csv('data/invoices.csv')
  end

  def find_by_id(id)
    all.find { |invoice| invoice.id == id }
  end

  private

  def parse_csv(file)
    array = []
    CSV.foreach(file, :headers => true, :header_converters => :symbol, :converters => :integer) do |row|
      array << Invoice.new(row[:id], row[:name], Time.parse(row[:created_at]), Time.parse(row[:updated_at]))
    end
    array
  end
end
