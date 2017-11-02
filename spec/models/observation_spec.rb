require 'rails_helper'

describe Observation do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a comment" do
        user = create(:user)
        student = create(:student)
        observation = Observation.new(date: "2017-10-30", subject: "math", ob_type: "improvement", student: student, user: user)
        expect(observation).to be_invalid
      end

      it "is invalid without a date" do
        user = create(:user)
        student = create(:student)
        observation = Observation.new(comment: "Something good", subject: "math", ob_type: "improvement", student: student, user: user)
        expect(observation).to be_invalid
      end

      it "is invalid without a subject" do
        user = create(:user)
        student = create(:student)
        observation = Observation.new(comment: "Something good", date: "2017-10-30", ob_type: "improvement", student: student, user: user)
        expect(observation).to be_invalid
      end

      it "is invalid without a ob_type" do
        user = create(:user)
        student = create(:student)
        observation = Observation.new(comment: "Something good", date: "2017-10-30", subject: "math", student: student, user: user)
        expect(observation).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a comment, date, subject and ob_type" do
        user = create(:user)
        student = create(:student)
        observation = Observation.new(comment: "Something good", date: "2017-10-30", subject: "math", ob_type: "improvement", student: student, user: user)
        expect(observation).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a student" do
      observation = create(:observation)
      expect(observation).to respond_to(:student)
    end
    it "belongs to a user" do
      observation = create(:observation)
      expect(observation).to respond_to(:user)
    end
  end
end
