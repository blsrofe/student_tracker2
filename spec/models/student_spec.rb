require 'rails_helper'

describe Student do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first name" do
        student = Student.new(last_name: "Smith", email: "joe@gmail.com", grade_level: "1")
        expect(student).to be_invalid
      end

      it "is invalid without a last name" do
        student = Student.new(first_name: "Joe", email: "joe@gmail.com", grade_level: "1")
        expect(student).to be_invalid
      end

      it "is invalid without an email" do
        student = Student.new(first_name: "Joe", last_name: "Smith", grade_level: "1")
        expect(student).to be_invalid
      end

      it "is invalid without a grade_level" do
        student = Student.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com")
        expect(student).to be_invalid
      end

      it "is invalid without a unique email" do
        student = Student.create(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", grade_level: "1")
        student_1 = Student.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", grade_level: "1")
        expect(student_1).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a first_name, last_name, password and email" do
        student = Student.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", grade_level: "1")
        expect(student).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many klasses" do
      student = create(:student)
      expect(student).to respond_to(:klasses)
    end

    it "has many klass_students" do
      student = create(:student)
      expect(student).to respond_to(:klass_students)
    end

    it "has many observations" do
      student = create(:student)
      expect(student).to respond_to(:observations)
    end
  end
end
