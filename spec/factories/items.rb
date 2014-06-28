FactoryGirl.define do
  factory :item do
    id 1
    name 'Item Qui Esse'
    description 'Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.'
    unit_price 75107
    merchant_id 1
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end
end
