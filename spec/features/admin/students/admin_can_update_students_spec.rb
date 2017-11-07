require "rails_helper"

describe "As an admin" do
  it "can update student info" do
    student = create(:student)
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_students_path

    click_on "Update"
    expect(current_path).to eq(edit_admin_student_path(student))

    fill_in "Notes", with: "RTI"
    click_on "Update Student"

    expect(current_path).to eq(student_path(student))
    expect(page).to have_content("RTI")
    expect(page).to have_no_content("Medical")
  end
end
