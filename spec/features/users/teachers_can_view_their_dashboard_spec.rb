require 'rails_helper'

describe "As a teacher" do
  it "can view thier dashboard" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"
    expect(page).to have_link("Update Account")
    expect(page).to have_link("View Classes")
    expect(page).to have_link("View Observations")

  end
end
