require 'rails_helper'

describe "teacher can view all observations" do
  it "that they wrote" do
    user = create_list(:user, 2)
    user1 = User.first
    user2 = User.last
    klass1 = create(:klass, user: user1)
    klass2 = create(:klass, user: user2)
    students = create_list(:student, 25)
    klass1.students << students
    klass2.students << students
    student = Student.first
    observations2 = create_list(:observation, 5, user: user2)
    student.observations << observations2
    observations = create_list(:observation, 5, user: user1)
    student.observations << observations
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit dashboard_path

    click_on "View Observations"

    expect(current_path).to eq(observations_path)

    expect(page).to have_css(".observation", count: 5)
    within(first(".observation")) do
      expect(page).to have_content(observation.date)
      expect(page).to have_content(observation.comment)
      expect(page).to have_content(observation.subject)
      expect(page).to have_content(observation.ob_type)
      expect(page).to have_content(observation.parent_viewable?)
      #expect(page).to have_content(observation.tone)
      expect(page).to have_content("View")
    end
  end
end
