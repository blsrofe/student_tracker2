require 'rails_helper'

describe Klass do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        klass = Klass.new(school_year: "2017-2018", description: "A really fun time")
        expect(klass).to be_invalid
      end

      it "is invalid without a description" do
        klass = Klass.new(school_year: "2017-2018", title: "Science")
        expect(klass).to be_invalid
      end

      it "is invalid without an school_year" do
        klass = Klass.new(title: "Science", description: "A really fun time")
        expect(klass).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, description, and school year" do
        klass = Klass.new(school_year: "2017-2018", description: "A really fun time", title: "Science")
        expect(klass).to be_valid
      end
    end
  end
end
