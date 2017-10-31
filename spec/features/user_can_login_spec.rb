require "rails_helper"

describe "As a registered user" do
  it "I can log in" do
    visit '/'
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: "joe@gmail.com"
    fill_in :password, with: "password"

    click_on "Login"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome, Joe")
  end
end
