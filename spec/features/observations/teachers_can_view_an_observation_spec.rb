require 'rails_helper'

describe "teacher can view an observation" do
  it "from the dashboard" do
    user = create(:user)
    klass1 = create(:klass, user: user)
    students = create_list(:student, 25)
    klass1.students << students
    student = Student.first
    observations2 = create_list(:observation, 5, user: user)
    student.observations << observations2
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit observations_path


    expect(page).to have_css(".observation", count: 5)
    within(first(".observation")) do
      click_on "View"
    end
    expect(current_path).to eq(observation_path(observation))
    expect(page).to have_content(observation.comment)
    expect(page).to have_content(observation.date)
    expect(page).to have_content(observation.user.full_name)
    expect(page).to have_content(observation.ob_type)
    expect(page).to have_content(observation.subject)
    expect(page).to have_content(observation.student.full_name)
    expect(page).to have_content(observation.parent_viewable)
    expect(page).to have_content("Create New Observation")
    # expect(page).to have_content(observation.tone)
  end

  it "from the students_observations_path" do
    user = create(:user)
    klass1 = create(:klass, user: user)
    students = create_list(:student, 25)
    klass1.students << students
    student = Student.first
    observations2 = create_list(:observation, 5, user: user)
    student.observations << observations2
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit students_observations_path(student)

    expect(page).to have_css(".observation", count: 5)
    within(first(".observation")) do
      click_on "View"
    end
    expect(current_path).to eq(observation_path(observation))
    expect(page).to have_content(observation.comment)
    expect(page).to have_content(observation.date)
    expect(page).to have_content(observation.user.full_name)
    expect(page).to have_content(observation.ob_type)
    expect(page).to have_content(observation.subject)
    expect(page).to have_content(observation.student.full_name)
    expect(page).to have_content(observation.parent_viewable)
    expect(page).to have_content("Create New Observation")
    # expect(page).to have_content(observation.tone)
  end
end
