require "rails_helper"

describe "As a teacher" do
  it "I can log in with google" do
    stub_omniauth

    visit root_path
    click_on "Sign in with Google"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logout")
    expect(page).to have_content("Welcome Becki")
  end
end
