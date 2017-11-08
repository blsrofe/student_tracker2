require 'rails_helper'

describe "as an admin" do
  it "i can create observations" do
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
    click_on "Create New Observation"
    expect(current_path).to eq(new_observation_path)
    fill_in "Date", with: "01/01/2016"
    select( student.full_name, from: 'observation_student_id' )
    select( klass.title, from: 'observation_subject')
    choose('observation_ob_type_strength')
    check('Check to make viewable to parents')
    fill_in "Comment", with: "Great effort shown on math test today"
    click_on "Create Observation"

    expect(current_path).to eq(observations_path)
    new_observation = Observation.last
    expect(new_observation.comment).to eq("Great effort shown on math test today")
    expect(new_observation.parent_viewable).to eq(true)
    expect(new_observation.ob_type).to eq("Strength")
    expect(new_observation.subject).to eq(klass.title)
    expect(new_observation.student_id).to eq(student.id)
    expect(new_observation.tone).to eq("Joy")
  end
end
