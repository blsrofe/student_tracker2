require 'rails_helper'

# As a teacher
# When I visit "/klasses/:id/students"
# And I click on "View Observations"
# My path should be "/students/:id/observations
# And I should see the student's full name, grade level and email
# And I should see notes for the student if they exist
# And for each observation I should see a date and a comment and a subject
# And I should see a type and tone and if it is parent viewable or not
# And I should see a link to "View full Observation"

describe "teacher can view all observations" do
  it "for a specific student" do
    user = create(:user)
    klass = create(:klass, user: user)
    students = create_list(:student, 25)
    klass.students << students
    student = Student.first
    observations = create_list(:observation, 10)
    student.observations << observations
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit klass_students_path(klass)
    within(first(".student")) do
      click_on "View Observations"
    end

    expect(current_path).to eq(student_observations_path(student))
    expect(page).to have_content(student.full_name)
save_and_open_page
    expect(page).to have_css(".observation", count: 10)
    within(first(".observation")) do
      expect(page).to have_content(observation.date)
      expect(page).to have_content(observation.comment)
      expect(page).to have_content(observation.subject)
      expect(page).to have_content(observation.ob_type)
      expect(page).to have_content(observation.parent_viewable?)
      # expect(page).to have_content(observation.tone)
      expect(page).to have_content("View")
    end
  end
end