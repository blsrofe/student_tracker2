require "rails_helper"

describe "As a teacher" do
  it "can delete posts that I wrote from the observation show page" do
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

  it "I can't update observations that I didn't write" do
    user1 = create(:user)
    klass1 = create(:klass, user: user1)
    students = create_list(:student, 25)
    klass1.students << students
    student = Student.first
    observations1 = create_list(:observation, 5, user: user1)
    student.observations << observations1
    observation = Observation.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
    visit observation_path(observation)

    click_on "Delete"

    expect(current_path).to eq(observations_path)
    expect(page).to have_no_content(observation.comment)

  end

  it "can delete posts that I wrote from the observation show page" do
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

  it "I can not update observations that I didn't write" do
    user1, user2 = create_list(:user, 2)
    klass1 = create(:klass, user: user1)
    klass2 = create(:klass, user: user2, title: "Another Class")
    students = create_list(:student, 25)
    klass1.students << students
    klass2.students << students
    student = Student.first
    observations1 = create_list(:observation, 5, user: user1)
    student.observations << observations1
    observations2 = create_list(:observation, 5, user: user2)
    student.observations << observations2
    observation = Observation.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit observation_path(observation)

    expect(page).to have_no_content("Delete Observation")
  end
end
