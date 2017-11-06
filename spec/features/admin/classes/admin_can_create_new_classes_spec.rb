require "rails_helper"

describe "As an admin" do
  it "and create new klasses" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    create_list(:user, 2)
    teacher = User.first.full_name
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Create A Class"
    expect(current_path).to eq(new_admin_klass_path)
save_and_open_page
    fill_in "Title", with: "Math 1"
    select("2017-2018", from: "klass_school_year")
    fill_in "Description", with: "1st grade math"
    select(teacher, from: 'klass_user_id')
    click_on "Create Class"

    expect(current_path).to eq(klasses_path)
    expect(page).to have_content("Math 1")
    expect(page).to have_content("1st grade math")
  end
end
