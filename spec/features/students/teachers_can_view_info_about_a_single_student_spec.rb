require 'rails_helper'

describe "As a teacher" do
  it "can view info about a single student" do
    user = create(:user)
    klass1 = create(:klass, user: user)
    students = create_list(:student, 25)
    klass1.students << students
    student = Student.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit klass_students_path(klass1)

    within(first(".student")) do
      click_on "Student Details"
    end
    expect(current_path).to eq(student_path(student))
    expect(page).to have_content(student.full_name)
    expect(page).to have_content(student.grade_level)
    expect(page).to have_content(student.email)
    expect(page).to have_content(student.notes)
    expect(page).to have_link(klass1.title)
    expect(page).to have_content("Observations")
  end
end
