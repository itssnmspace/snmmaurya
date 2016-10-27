require 'rails_helper'

RSpec.feature "User can signin with correct creds"  do
  scenario "with correct username and passowrd" do

    visit root_path

    click_link "Login"

    fill_in "user[email]", with: "snm@snmmaurya.com"

    fill_in "user[password]", with: "snmmaurya"

    click_button "Log in"

    except(page).to have_content("Signed in success ")

  end
end