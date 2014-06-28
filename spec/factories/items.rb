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

  factory :item2, class: Item do
    id 2
    name 'Item Autem Minima'
    description 'Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.'
    unit_price 67076
    merchant_id 1
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end

  factory :item3, class: Item do
    id 3
    name 'Item Ea Voluptatum'
    description 'Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.'
    unit_price 32301
    merchant_id 1
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end
end
