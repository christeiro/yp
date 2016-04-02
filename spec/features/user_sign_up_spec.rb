require 'rails_helper'

feature "User Sign's up" do
  scenario "with valid input" do
    user = Fabricate.attributes_for(:user)
    visit root_path
    find("a[href='/register']").click

    fill_in "First name", with: user[:first_name]
    fill_in "Last name", with: user[:last_name]
    fill_in "Email", with: user[:email]
    fill_in "Password", with: user[:password]

    click_button "Register"

    expect(page).to have_content("Your account was created successfully!")
  end
  scenario "with invalid input" do
    user = Fabricate.attributes_for(:user)
    visit root_path
    find("a[href='/register']").click

    fill_in "First name", with: user[:first_name]
    fill_in "Last name", with: user[:last_name]
    fill_in "Email", with: user[:email]

    click_button "Register"

    expect(page).to have_content("Please fix the form errors!")
    expect(find_field("user_first_name").value).to eq(user[:first_name])
    expect(page).to have_field("First name", with: user[:first_name])
    expect(page).to have_field("Last name", with: user[:last_name])
    expect(page).to have_field("Email", with: user[:email])
  end
end