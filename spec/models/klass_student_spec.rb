require 'rails_helper'

describe User do
  describe "relationships" do
    it "belongs to a klass" do
      klass_student = create(:klass_student)
      expect(klass_student).to respond_to(:klass)
    end

    it "belongs to a student" do
      klass_student = create(:klass_student)
      expect(klass_student).to respond_to(:student)
    end
  end
end
