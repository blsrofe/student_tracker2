require 'rails_helper'

describe "As a teacher" do
  it "can view thier classes on the user dashboard" do
    user = create(:user)
    klasses = create_list(:klass, 3)
    user.klasses << klasses
    klass1 = user.klasses.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"
    expect(page).to have_css(".klass", count: 3)
    within(first(".klass")) do
      expect(page).to have_content(klass1.title)
      expect(page).to have_content(klass1.school_year)
      expect(page).to have_content(klass1.description)
    end
  end
end
