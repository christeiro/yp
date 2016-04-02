require 'rails_helper'

feature "User logs in" do
  scenario "with valid input" do
    user = Fabricate(:user)
    visit root_path
    find("a[href='/sign_in']").click

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Register")
    expect(page).to have_content("Logout")
  end
  scenario "with invalid input" do
    user = Fabricate(:user)
    visit root_path
    find("a[href='/sign_in']").click

    fill_in "Email", with: user.email
    click_button "Login"

    expect(page).to have_content("Invalid e-mail or password")
  end
end