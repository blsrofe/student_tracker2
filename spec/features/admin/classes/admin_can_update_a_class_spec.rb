require "rails_helper"

describe "As an admin" do
  it "can update klasses" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    user = create(:user)
    klass = create(:klass, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit klasses_path

    click_on "Update"
    expect(current_path).to eq(edit_admin_klass_path(klass))

    fill_in "Description", with: "Addition and Subtraction"
    click_on "Create or Update Class"

    expect(current_path).to eq(klass_path(klass))
    expect(page).to have_content("Addition and Subtraction")
    expect(page).to have_no_content("1st grade math")
  end
end
