require 'rails_helper'

feature "User interacts with the site" do
  scenario "user can see businesses" do
    company = Fabricate(:company)
    user = Fabricate(:user)
    review = Fabricate(:review, company: company, user: user)
    visit root_path

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.description)
    expect(page).to have_content(company.category.name)
    expect(page).to have_content(company.city)

    find("h2 a[href='/companies/#{company.id}']").click

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.email)
    expect(page).to have_content(company.phone)

  end
  scenario "user can see other users profiles and reviews" do
    company = Fabricate(:company)
    user = Fabricate(:user)
    review = Fabricate(:review, company: company, user: user)
    visit root_path

    find("h2 a[href='/companies/#{company.id}']").click

    expect(page).to have_content("#{user.first_name} #{user.last_name}")

    find("a[href='/users/#{user.id}']").click
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(review.content)
  end
  scenario "user adds a review" do
    user = Fabricate(:user)
    company = Fabricate(:company)
    review = Faker::Lorem.paragraph(2)
    visit root_path

    find("a[href='/sign_in']").click

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Login"

    find("a[href='/']").click
    find("h2 a[href='/companies/#{company.id}']").click
    fill_in "review_content", with: review
    click_button "Submit Review"
    expect(page).to have_content(review)
    within "div.testimonial-sign" do
      find("a[href='/users/#{user.id}']").click
    end
    expect(page).to have_content(review)
  end
end