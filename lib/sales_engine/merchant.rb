Merchant = Struct.new(
  :id,
  :name,
  :created_at,
  :updated_at,
  :find_all_invoices_by_merchant_id,
  :find_all_items_by_merchant_id,
  keyword_init: true
) do

  def invoices
    find_all_invoices_by_merchant_id.call(id)
  end

  def items
    find_all_items_by_merchant_id.call(id)
  end
end
