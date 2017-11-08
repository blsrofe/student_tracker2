require 'rails_helper'

describe "as an admin" do
  it "I can update observations that I wrote" do
    user = create(:user)
    admin = create(:user, role: 1)
    klass = create(:klass, user: admin)
    students = create_list(:student, 25)
    klass.students << students
    student = Student.first
    observations = create_list(:observation, 5, user: admin)
    student.observations << observations
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit observation_path(observation)

    click_on "Update Observation"

    expect(current_path).to eq(edit_observation_path(observation))

    fill_in "Comment", with: "This is my new comment"
    click_on "Update Observation"

    expect(current_path).to eq(observation_path(observation))
    expect(page).to have_content("This is my new comment")
  end

  it "I can't update observations that I didn't write" do

    user = create(:user)
    admin = create(:user, role: 1)
    klass = create(:klass, user: admin)
    students = create_list(:student, 25)
    klass.students << students
    student = Student.first
    observations = create_list(:observation, 5, user: user)
    student.observations << observations
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit observation_path(observation)

    expect(page).to have_no_content("Update Observation")

  end
end
