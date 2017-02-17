FactoryGirl.define do
  factory :product do
    name('Hot Chicken')
    price(7)
    description('delicious description')
    image { fixture_file_upload 'spec/fixtures/images/chickensample.jpg', 'image/jpg' }
  end
end
