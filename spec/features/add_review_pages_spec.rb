require 'rails_helper'

describe 'add a review' do
  it 'allows an authenticated basic user to add a review to a product' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link 'Post Review'
    fill_in 'Content', :with => 'this is so good.'
    click_button 'Create Review'
    expect(page).to have_content 'this is so good'
  end
end
