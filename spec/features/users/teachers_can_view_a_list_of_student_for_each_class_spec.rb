require "rails_helper"

# As a teacher
# When I visit /class/:id/students
# Then I should see the class name
# And i should see a list of students in that class
# And for each student I should see thier full name and grade level
# And I should see I link to view their observations
# And I should see a link to add an observation

describe "teacher visits class show page and sees a list of students" do
  it "should be able to click on add or view observations" do
    user = create(:user)
    klass = create(:klass, user: user)
    students = create_list(:student, 25)
    klass.students << students
    student1 = Student.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/klasses/#{klass.id}"

    expect(page).to have_content(klass.title)
    expect(page).to have_content(klass.school_year)
    expect(page).to have_content(klass.description)
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
