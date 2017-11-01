require "rails_helper"

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
  it "from the student show page" do
    user = create(:user)
    klass = create(:klass, user: user)
    students = create_list(:student, 25)
    klass.students << students
    student = Student.first
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/klasses/:id/students"
    click_on "View Observations"

    expect(current_path).to eq(student_observations_path(student))
    expect(page).to have_content(student.full_name)
    expect(page).to have_content(student.grade_level)
    expect(page).to have_content(student.email)

    expect(page).to have_css(".observation", count: 10)
    within(first(".observation")) do
      expect(page).to have_content(observation.date)
      expect(page).to have_content(observation.comment)
      expect(page).to have_content(observation.subject)
      expect(page).to have_content(observation.type)
      expect(page).to have_content(observation.parent_viewable?)
      # expect(page).to have_content(observation.tone)
      expect(page).to have_content("View Full Observation")
    end
  end
end
