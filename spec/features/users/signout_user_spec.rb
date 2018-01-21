require 'rails_helper'

RSpec.feature 'When a user signs out' do

    before do
      @valid_user = User.create!(email: "user@valid.com", password: "Password1!")
      visit "/"

      click_link "Sign in"
      fill_in "Email", with: @valid_user.email
      fill_in "Password", with: @valid_user.password

      click_button "Log in"
    end

    scenario 'their session is properly terminated' do
      click_link "Sign out"

      expect(page).to have_content("Sign up") && have_content("Sign in")
      expect(page).to have_content("Signed out successfully")
      expect(page).not_to have_content("Welcome #{@valid_user.email}!")
    end

end