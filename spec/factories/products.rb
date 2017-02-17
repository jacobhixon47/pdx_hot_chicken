FactoryGirl.define do
  factory :product do
    name('Hot Chicken')
    description('delicious description')
    image { fixture_file_upload 'spec/fixtures/images/chickensample.jpg', 'image/jpg' }
  end
end
