require "rails_helper"

describe "As a registered user" do
  it "I can log in" do
    user = User.create!(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")

    visit '/'
    click_link "Login"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: "joe@gmail.com"
    fill_in "Password", with: "password"
    find('.login').click

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome Joe")
  end
end
