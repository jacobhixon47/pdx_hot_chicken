require 'rails_helper'

describe 'add a product' do
  it 'allows an admin to add a product' do
    user = FactoryGirl.create(:user, :admin => true)
    login_as(user, :scope => :user)
    visit '/'
    click_link '+ Add Product'
    fill_in 'Name', :with => 'Hot Chicken'
    fill_in 'Description', :with => 'delicious hot chicken'
    page.attach_file('product[image]', 'spec/fixtures/images/chickensample.jpg')
    click_button 'Create Product'
    expect(page).to have_content 'Hot Chicken'
  end
end
