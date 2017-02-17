require 'rails_helper'

describe 'delete a review' do
  it 'allows an authenticated basic user to delete a review' do
    user = FactoryGirl.create(:user, :admin => true)
    login_as(user, :scope => :user)
    product = FactoryGirl.create(:product)
    review = FactoryGirl.create(:review, :user_id => user.id, :product_id => product.id)
    visit product_path(product)
    click_link 'Delete Review'
    expect(page).to have_content 'No Reviews'
  end
end
