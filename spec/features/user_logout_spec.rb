require 'rails_helper'

feature "User log out" do
  scenario "user is logged out" do
    user = Fabricate(:user)
    visit root_path
    find("a[href='/sign_in']").click

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    find("a[href='/sign_out']").click
    expect(page).to have_content("You've been signed out!")
    expect(page).not_to have_content(user.first_name)
    expect(page).not_to have_content("Logout")
  end
end