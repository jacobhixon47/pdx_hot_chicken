FactoryGirl.define do
  factory :user do
    username('joedirt25')
    email('joedirt25@nascar.com')
    password('joedirt12345')
    admin(false) 
  end
end
