class TestMerchantRepositoryFactory
  def call(params)
    Merchant.new({
      id: 1,
      name: 'Diaminx Corp',
      created_at: Time.new(2014, 6, 1),
      updated_at: Time.new(2014, 6, 1),
    }.merge(params))
  end
end
