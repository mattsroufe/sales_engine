FactoryGirl.define do
  factory :invoice do
    id 1
    customer_id 1
    merchant_id 1
    status 'shipped'
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end
end
