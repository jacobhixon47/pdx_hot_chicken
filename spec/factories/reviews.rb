FactoryGirl.define do
  factory :review do
    content('this is so good')
    user_id(1)
    product_id(1)
  end
end
