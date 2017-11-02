require "rails_helper"

# As a teacher
# When I visit /dashboard
# And I click "Update Account"
# Then my path should be "user/:id/edit"
# and I should see a form to update my name, email, and password
# And when I click "Update"
# My path should be "/dashboard"
# And I should see my info updated on the screen

describe "teachers can update thier account information" do
  it "from the dashboard page" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"
    click_on "Update Account"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Email", with: "new@gmail.com"
    fill_in "Password", with: "new"
    click_on "Update Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("John Smith")
  end
end
