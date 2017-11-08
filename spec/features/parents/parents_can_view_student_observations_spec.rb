require 'rails_helper'

describe "As a parent" do
  it "can view approved observations for their students" do
    user = create(:user)
    parent = create(:parent)
    student = create(:student)
    parent.students << student
    observations = create_list(:observation, 5, parent_viewable: true, user: user)
    student.observations << observations

    allow_any_instance_of(ApplicationController).to receive(:current_parent).and_return(parent)

    visit parent_dashboard_path
    click_on "Observations"
    expect(page).to have_css(".observation", count: 5)
  end

  it "can not view unapproved observations" do
    user, user2 = create_list(:user, 2)
    parent = create(:parent)
    student = create(:student)
    parent.students << student
    observations = create_list(:observation, 5, user: user)
    observations2 = create_list(:observation, 2, parent_viewable: true, user: user2)
    student.observations << observations
    student.observations << observations2

    allow_any_instance_of(ApplicationController).to receive(:current_parent).and_return(parent)

    visit parent_dashboard_path
    click_on "Observations"
    expect(page).to have_css(".observation", count: 2)
  end
end
