FactoryGirl.define do
  factory :merchant do
    id 1
    name 'Diaminx Corp'
    created_at Time.new(2014, 6, 1)
    updated_at Time.new(2014, 6, 1)

    initialize_with { new(attributes) }
  end
end
