require 'rails_helper'

describe "As a teacher" do
  it "can view thier classes on the user dashboard" do
    user = User.create!(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    expect(page).to have_css(".klass", count: 3)
    within(first(".klass")) do
      expect(page).to have_content(klass1.title)
      expect(page).to have_content(klass1.school_year)
    end
  end
end
