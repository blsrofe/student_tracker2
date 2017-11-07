require "rails_helper"

describe "As an admin" do
  it "can drop students from a class" do
    admin = User.create!(first_name: "Lynn", last_name: "Rivard", email: "lynn@gmail.com", password: "password", role: 1)
    student = create(:student)
    klass = create(:klass)
    student.klasses << klass
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit klass_students_path(klass)

    click_on "Drop"

    expect(current_path).to eq(klasses_path)
    expect(page).to have_no_content(student.full_name)
  end
end
