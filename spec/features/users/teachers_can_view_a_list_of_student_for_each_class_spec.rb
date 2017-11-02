require "rails_helper"

describe "teacher visits student index page" do
  it "and sees all students for that class" do
    user = create(:user)
    klass = create(:klass, user: user)
    students = create_list(:student, 25)
    klass.students << students
    student1 = Student.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit klass_students_path(klass)

    expect(page).to have_content(klass.title)
    expect(page).to have_content(klass.school_year)
    expect(page).to have_content(klass.user.full_name)

    expect(page).to have_css(".student", count: 25)
    within(first(".student")) do
      expect(page).to have_content(student1.full_name)
      expect(page).to have_content(student1.grade_level)
      expect(page).to have_link("View Observations")
      expect(page).to have_link("New Observation")
    end
  end
end
