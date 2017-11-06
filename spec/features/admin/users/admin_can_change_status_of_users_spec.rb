require "rails_helper"

describe "As an admin" do
  it "can toggle user status" do
    user = create(:user)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path
    expect(user.role).to eq("teacher")

    within(first(".user")) do
      click_on "Make Admin"
    end
    
    expect(user.role).to eq("admin")

    within(first(".user")) do
      click_on "Remove Admin Status"
    end

    expect(user.role).to eq("teacher")
  end
end
