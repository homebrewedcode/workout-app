require 'rails_helper'

RSpec.feature 'When a user creates an exercise' do

  before do
    @valid_user = User.create(email: 'valid@example.com', password: 'password')
    login_as(@valid_user)
  end

  scenario 'with valid inputs' do
    visit "/"
    click_link "My Lounge"
    click_link  "New Workout"

    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity Date", with: "2018-01-15"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last

    expect(current_path).to eq(user_exercise_path(@valid_user, exercise))
    expect(exercise.user_id).to eq(@valid_user.id)

  end

end