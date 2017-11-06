require "rails_helper"

describe "As an admin" do
  it "can delete students" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    student = create(:student)
    user = create(:user)
    observations = create_list(:observation, 2, user: user, student: student)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_students_path
    expect(page).to have_css(".student", count: 1)

    click_on "Delete"

    expect(current_path).to eq(admin_students_path)
    expect(page).to have_no_css(".student")
  end
end
