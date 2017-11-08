require "rails_helper"

describe "As a registered user" do
  it "I can log in" do
    user = create(:user)

    visit '/'
    click_on "Teacher Login"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    find('.login').click

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome Joe")
  end
end
