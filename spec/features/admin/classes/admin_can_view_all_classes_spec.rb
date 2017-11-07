require 'rails_helper'

describe "As an admin" do
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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit klasses_path
    expect(page).to have_css(".klass", count: 5)

    within(first(".klass")) do
      expect(page).to have_content(klass1.title)
      expect(page).to have_content(klass1.school_year)
      expect(page).to have_content(klass1.description)
      expect(page).to have_content(klass1.user.full_name)
    end
  end
end
