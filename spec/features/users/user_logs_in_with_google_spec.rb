require "rails_helper"

describe "As a teacher" do
  it "I can log in with google if I have an account" do
    user = User.create!(first_name: "Jim", last_name: "Scott", email: "jim@gmail.com", password: "password")

    stub_omniauth

    visit root_path
    click_on "Sign in with Google"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome Jim")
  end

  it "I can not log in with google if I don't have an account" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Google"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login Unsuccessful. Check with your administrator if you have not been provided with an account.")
  end
end
