require 'rails_helper'

describe Klass do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        user = create(:user)
        klass = Klass.new(school_year: "2017-2018", description: "A really fun time", user: user)
        expect(klass).to be_invalid
      end

      it "is invalid without a description" do
        user = create(:user)
        klass = Klass.new(school_year: "2017-2018", title: "Science", user: user)
        expect(klass).to be_invalid
      end

      it "is invalid without an school_year" do
        user = create(:user)
        klass = Klass.new(title: "Science", description: "A really fun time", user: user)
        expect(klass).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, description, and school year" do
        user = create(:user)
        klass = Klass.new(school_year: "2017-2018", description: "A really fun time", title: "Science", user: user)
        expect(klass).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a user" do
      klass = create(:klass)
      expect(klass).to respond_to(:user)
    end

    it "has many klass_students" do
      klass = create(:klass)
      expect(klass).to respond_to(:enrollments)
    end

    it "has many students" do
      klass = create(:klass)
      expect(klass).to respond_to(:students)
    end
  end
end
