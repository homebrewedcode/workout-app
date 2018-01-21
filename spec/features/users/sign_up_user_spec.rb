require 'rails_helper'

RSpec.feature 'When a user signs up' do

  scenario 'they enter valid inputs' do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "dale@example.com"
    fill_in "Password", with: "Password1!"
    fill_in "Password confirmation", with: "Password1!"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end

  scenario 'they enter invalid email' do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "not_an_email@"
    fill_in "Password", with: "Password1!"
    fill_in "Password confirmation", with: "Password1!"
    click_button "Sign up"

    expect(page).to have_content("Email is invalid")
  end

  scenario 'they enter non-matching passwords' do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "Password1!"
    fill_in "Password confirmation", with: "DoesNotMatch"
    click_button "Sign up"

    expect(page).to have_content("Password confirmation doesn't match")
  end

end