Invoice = Struct.new(
  :id,
  :customer_id,
  :merchant_id,
  :status,
  :created_at,
  :updated_at,
  keyword_init: true
)
