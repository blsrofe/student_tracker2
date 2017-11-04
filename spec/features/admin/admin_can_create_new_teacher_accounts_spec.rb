require "rails_helper"

describe "Admin can create new teacher accounts" do
  it "from the dashboard page" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "Add Account"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "new@gmail.com"
    fill_in "Password", with: "password"
    select("teacher", from: 'user_role')
    click_on "Create Account"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Account created for John Smith")
  end
end
