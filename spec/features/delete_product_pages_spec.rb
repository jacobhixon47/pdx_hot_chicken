require 'rails_helper'

describe 'delete a product' do
  it 'allows an admin to delete a product' do
    user = FactoryGirl.create(:user, :admin => true)
    login_as(user, :scope => :user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link 'Delete'
    expect(page).to have_content 'no products listed'
  end
end
