require 'rails_helper'

describe Enrollment do
  describe "relationships" do
    it "belongs to a klass" do
      enrollment = create(:enrollment)
      expect(enrollment).to respond_to(:klass)
    end

    it "belongs to a student" do
      enrollment = create(:enrollment)
      expect(enrollment).to respond_to(:student)
    end
  end
end
