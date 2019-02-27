class InvoiceRepository < SimpleDelegator

  def initialize(sales_engine, data = DATA[self.class.name][SALES_ENGINE_ENV])
    super([])
    load_csv_data(data)
  end

  def all
    self
  end

  def random
    sample
  end

  def find_by_id(id)
    find { |object| object.id == id }
  end

  def find_by_name(name)
    detect { |merchant| merchant.name =~ /\A#{name}\z/i }
  end

  def create(args = {})
    self << invoice = Invoice.new(
      customer_id: args[:customer].id,
      merchant_id: args[:merchant].id,
      status:      args[:status],
      created_at:  Time.now,
      updated_at:  Time.now
    )
    args[:items].each do |item|
      # invoice_item_repository << InvoiceItem.new(
      #   item_id:    item.id,
      #   invoice_id: invoice.id,
      #   quantity:   1,
      #   unit_price: item.unit_price,
      #   created_at: Time.now,
      #   updated_at: Time.now
      # )
    end
  end

  def find_all_by_merchant_id(merchant_id)
    select { |invoice| invoice.merchant_id == merchant_id }
  end

  private

  def load_csv_data(data)
    CSV.parse(data, headers: true, header_converters: :symbol, converters: :integer) do |row|
      row[:created_at] = Time.parse(row[:created_at])
      row[:updated_at] = Time.parse(row[:updated_at])
      self << Object.const_get(self.class.to_s.gsub('Repository', '')).new(row.to_h)
    end
  end
end
