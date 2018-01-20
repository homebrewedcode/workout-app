require 'rails_helper'

RSpec.feature 'When visiting the homepage' do

  scenario 'we should see a link called "Home"' do
    visit "/"
    expect(page).to have_link("Home")
  end

  scenario 'we should see a link called "Athletes Den"' do
    visit "/"
    expect(page).to have_link("Athletes Den")
  end

  scenario 'we should see the content "Workout Lounge!"' do
    visit "/"

  end

  scenario 'we should see the content "Show off your workout"' do

  end

end