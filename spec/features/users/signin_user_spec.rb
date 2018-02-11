require 'rails_helper'

RSpec.feature 'When a user signs in' do

    before do
      @valid_user = User.create!(email: "valid@example.com", password:"Password123!@#")
    end

    scenario 'with good credentials' do
      visit "/"

      click_link "Sign in"
      fill_in "Email", with: @valid_user.email
      fill_in "Password", with: @valid_user.password

      click_button "Log in"

      expect(page).to have_content("Signed in successfully")
      expect(page).to have_content("Signed in as #{@valid_user.email}")
      expect(page).to have_content("Sign out")
      expect(page).not_to have_content("Sign up")
      expect(page).not_to have_content("Sign in")
    end

    scenario 'with bad credentials' do
      visit "/"

      click_link "Sign in"
      fill_in "Email", with: "bad@creds.com"
      fill_in "Password", with: "doesntMatter123!@"
      click_button "Log in"

      expect(page).to have_content("Invalid Email or password.")
      expect(page).to have_content("Sign up") && have_content("Sign in")
      expect(page).not_to have_content("Welcome bad@creds.com!")
      expect(page).not_to have_content("Sign out")
    end

end