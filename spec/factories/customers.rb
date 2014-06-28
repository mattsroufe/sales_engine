FactoryGirl.define do
  factory :customer do
    id 1
    first_name 'Joey'
    last_name 'Ondricka'
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end
end
