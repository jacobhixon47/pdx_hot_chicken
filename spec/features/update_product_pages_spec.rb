require 'rails_helper'

describe 'update a product' do
  it 'allows an admin to update a product' do
    user = FactoryGirl.create(:user, :admin => true)
    login_as(user, :scope => :user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Name', :with => 'Hot Chickenzz'
    click_button 'Update Product'
    expect(page).to have_content 'Hot Chickenzz'
  end
end
