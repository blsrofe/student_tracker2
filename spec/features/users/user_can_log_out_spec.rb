require "rails_helper"

describe "As a registered user" do
  it "I can log out" do
    user = create(:user)

    visit '/'
    click_on "Teacher Login"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    find('.login').click

    find(".logout").click

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end
end
