require 'rails_helper'

describe "As an admin" do
  it "I can delete users" do

    users = create_list(:user, 10)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "View All Users"
    expect(page).to have_css(".user", count: 11)

    within(first(".user")) do
      click_on "Delete"
    end

    expect(page).to have_css(".user", count: 10)
  end
end
