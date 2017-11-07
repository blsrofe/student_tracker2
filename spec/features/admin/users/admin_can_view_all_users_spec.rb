require 'rails_helper'

describe "As an admin" do
  it "Can view all users" do

    users = create_list(:user, 10)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "View All Users"
    expect(current_path).to eq(admin_users_path)

    expect(page).to have_css(".user", count: 11)
  end
end
