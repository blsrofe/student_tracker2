require "rails_helper"

describe "As an admin" do
  it "can delete klasses" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    user = create(:user)
    klasses = create_list(:klass, 2, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit klasses_path
    expect(page).to have_css(".klass", count: 2)

    within(first(".klass")) do
      click_on "Delete"
    end
    expect(current_path).to eq(klasses_path)
    expect(page).to have_css(".klass", count: 1)
  end
end
