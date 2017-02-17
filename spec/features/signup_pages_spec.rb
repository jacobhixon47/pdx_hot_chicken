require 'rails_helper'

describe "creates a user" do
  it "creates a user account" do
    visit new_user_registration_path
    fill_in 'Username', :with => 'joedirt'
    fill_in 'Email', :with => 'joedirt25@nascar.com'
    fill_in 'Password', :with => 'nascar12345'
    fill_in 'Password confirmation', :with => 'nascar12345'
    click_on 'Sign up'
    expect(page).to have_content 'signed up'
  end
end
