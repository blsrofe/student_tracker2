require "rails_helper"

describe "User can visit their dashboard" do
  context "As an admin" do
    it "and create new accounts" do
      admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on "Create New User"
      fill_in "First name", with: "John"
      fill_in "Last name", with: "Smith"
      fill_in "Email", with: "new@gmail.com"
      select("Teacher", from: 'user_role')
      click_on "Create Account"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Account created for John Smith")
    end
  end

  context "As a teacher" do
    it "and can't create new accounts" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page).to_not have_content("Add Account")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
