require "rails_helper"

describe "As a registered user" do
  it "I can log out" do
    user = User.create!(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end
end
