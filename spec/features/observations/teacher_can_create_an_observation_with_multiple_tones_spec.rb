require 'rails_helper'

describe "as a teacher" do
  it "i can create observations with multiple tones" do
    user = create(:user)
    classes = create_list(:klass, 2, user: user)
    klass1 = Klass.first
    klass2 = Klass.last
    students = create_list(:student, 25)
    klass1.students << students
    klass2.students << students
    student = Student.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit students_observations_path(student)
    click_on "Create New Observation"
    expect(current_path).to eq(new_observation_path)
    fill_in "Date", with: "01/01/2016"
    select( student.full_name, from: 'observation_student_id' )
    select( klass1.title, from: 'observation_subject')
    choose('observation_ob_type_strength')
    check('Check to make viewable to parents')
    fill_in "Comment", with: "Great effort shown on math test today. Sydney has improved in her attempts at long division. I am still worried about her fact fluency and behavior."
    click_on "Create Observation"

    expect(current_path).to eq(observations_path)
    new_observation = Observation.last
    expect(new_observation.comment).to eq("Great effort shown on math test today. Sydney has improved in her attempts at long division. I am still worried about her fact fluency and behavior.")
    expect(new_observation.parent_viewable).to eq(true)
    expect(new_observation.ob_type).to eq("Strength")
    expect(new_observation.subject).to eq(klass1.title)
    expect(new_observation.student_id).to eq(student.id)
    expect(new_observation.tone).to eq("Analytical, Tentative")
  end
end
