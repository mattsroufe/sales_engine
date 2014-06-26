class InvoiceRepository < Repository
  include Singleton

  attr_reader :all

  def initialize
    @all = []
  end

  def find_all_by_merchant_id(merchant_id)
    all.select { |invoice| invoice.merchant_id == merchant_id }
  end

  private

  def parse_csv
    CSV.foreach('data/invoices.csv', :headers => true, :header_converters => :symbol, :converters => :integer) do |row|
      Invoice.new(
        id:          row[:id],
        customer_id: row[:customer_id],
        merchant_id: row[:merchant_id],
        status:      row[:status],
        created_at:  Time.parse(row[:created_at]),
        updated_at:  Time.parse(row[:updated_at])
      )
      end
  end
end
