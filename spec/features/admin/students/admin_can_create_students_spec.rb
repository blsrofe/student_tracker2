require "rails_helper"

describe "As an admin" do
  it "can create new students" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Create A Student"
    expect(current_path).to eq(new_admin_student_path)
    fill_in "First name", with: "Johnny"
    fill_in "Last name", with: "Thompson"
    fill_in "Notes", with: "Medical"
    select("2", from: "student_grade_level")
    fill_in "Email", with: "johnny@school.edu"
    click_on "Create Student"

    expect(current_path).to eq(admin_students_path)
    expect(page).to have_content("Johnny Thompson")
    expect(page).to have_content("2")
  end

  it "can't create new students without a first_name" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "Create A Student"
    expect(current_path).to eq(new_admin_student_path)
    fill_in "Last name", with: "Thompson"
    fill_in "Notes", with: "Medical"
    select("2", from: "student_grade_level")
    fill_in "Email", with: "johnny@school.edu"
    click_on "Create Student"

    expect(current_path).to eq(new_admin_student_path)
  end
end
