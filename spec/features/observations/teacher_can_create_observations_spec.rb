require 'rails_helper'

describe "as a teacher" do
  it "i can create observations" do
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

    click_on "Create New Observation"

    expect(current_path).to eq(new_observation_path)

    fill_in "Date", with: "01/01/2016"
    select( student.full_name, from: 'student_id' )
    select( klass1.title, from: 'subject')
    choose('ob_type_strength')
    check('Check to make viewable to parents')
    fill_in "Comment", with: "This is my comment"
    click_on "Create Observation"

    expect(current_path).to eq(observations_path)
    new_observation = Observation.last
    expect(new_observation.comment).to eq("This is my comment")
    expect(new_observation.parent_viewable).to eq(true)
    expect(new_observation.ob_type).to eq("Strength")
    expect(new_observation.subject).to eq(klass1.title)
    expect(new_observation.date).to eq("01/01/2016")
    expect(new_observation.student_id).to eq(student.id)
  end
end
