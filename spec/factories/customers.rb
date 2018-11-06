class TestCustomerFactory
  def call(params)
    Customer.new(
      id: 1,
      first_name: 'Joey',
      last_name: 'Ondricka',
      created_at: Time.new(2014, 6, 1),
      updated_at: Time.new(2014, 6, 1),
    )
  end
end
