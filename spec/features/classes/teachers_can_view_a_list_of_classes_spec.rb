require 'rails_helper'

describe "As a teacher" do
  it "it can view all classes" do
    create_list(:user, 2)
    user1 = User.first
    user2 = User.last
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    klasses = create_list(:klass, 3)
    second_classes = create_list(:klass, 2)
    user1.klasses << klasses
    user2.klasses << second_classes
    klass1 = user1.klasses.first
    klass2 = user2.klasses.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit "/dashboard"
    expect(page).to have_link("View Classes")
    expect(page).to have_link("View Observations")
    click_on "View Classes"

    expect(current_path).to eq(klasses_path)

    expect(page).to have_css(".klass", count: 3)
    within(first(".klass")) do
      expect(page).to have_content(klass1.title)
      expect(page).to have_content(klass1.school_year)
      expect(page).to have_content(klass1.description)
      expect(page).to have_content(klass1.user.full_name)
    end
  end

  it "can't view classes that it doesn't teach" do
    create_list(:user, 2)
    user1 = User.first
    user2 = User.last
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    klasses = create_list(:klass, 3)
    second_classes = create_list(:klass, 2)
    user1.klasses << klasses
    user2.klasses << second_classes
    klass1 = user1.klasses.first
    klass2 = user2.klasses.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit "/dashboard"
    expect(page).to have_link("View Classes")
    expect(page).to have_link("View Observations")
    click_on "View Classes"

    expect(current_path).to eq(klasses_path)

    expect(page).to have_no_content(klass2.title)
  end
end
