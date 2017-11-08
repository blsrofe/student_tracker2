require "rails_helper"

describe "As a parent" do
  it "I can log in" do
    parent = Parent.create!(first_name: "Betty1", last_name: "Smith", phone_number: "303-345-4567", email: "new#gmail.com", password: "password")
    student = create(:student)
    parent.students << student

    visit '/'
    click_link "Parent Login"

    expect(current_path).to eq(parent_login_path)

    fill_in "Email", with: parent.email
    fill_in "Password", with: parent.password
    find('.login').click

    expect(current_path).to eq(parent_dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome Betty1")
  end

  it "I can log out" do
    parent = create(:parent)
    student = create(:student)
    parent.students << student

    visit '/'
    click_link "Parent Login"

    fill_in "Email", with: parent.email
    fill_in "Password", with: parent.password
    find('.login').click

    expect(current_path).to eq(parent_dashboard_path)
    find('.logout').click

    expect(current_path).to eq(root_path)
  end
end
