require "rails_helper"

describe "As an admin" do
  it "can add students to a class" do
    klass = create(:klass)
    student = create(:student)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(student.klasses.count).to eq(0)

    click_on "Enroll Student"

    expect(current_path).to eq(new_admin_enrollment_path)
    select("1", from: "enrollment_klass_id")
    select(student.full_name, from: "enrollment_student_id")
    click_on "Create Enrollment"

    expect(current_path).to eq(admin_dashboard_path)
    expect(student.klasses.count).to eq(1)
  end

  it "can't add students to a class without selecting a class" do
    klass = create(:klass)
    student = create(:student)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(student.klasses.count).to eq(0)

    click_on "Enroll Student"

    expect(current_path).to eq(new_admin_enrollment_path)
    select(student.full_name, from: "enrollment_student_id")
    click_on "Create Enrollment"

    expect(current_path).to eq(new_admin_enrollment_path)
    expect(page).to have_content("Enrollment not saved. Make sure to fill in all fields")
  end
end
