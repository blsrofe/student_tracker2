require 'rails_helper'

describe "as a teacher" do
  it "I can update observations" do
    user = create(:user)
    classes = create_list(:klass, 2, user: user)
    klass1 = Klass.first
    klass2 = Klass.last
    students = create_list(:student, 25)
    klass1.students << students
    klass2.students << students
    student = Student.first
    observations2 = create_list(:observation, 5, user: user)
    student.observations << observations2
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit observation_path(observation)

    click_on "Update Observation"

    expect(current_path).to eq(edit_observation_path(observation))

    fill_in "Comment", with: "This is my new comment"
    click_on "Update Observation"

    expect(current_path).to eq(observation_path(observation))
    expect(page).to have_content("This is my new comment")
  end
end
