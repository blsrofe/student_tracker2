require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first name" do
        user = User.new(last_name: "Smith", email: "joe@gmail.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without a last name" do
        user = User.new(first_name: "Joe", email: "joe@gmail.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(first_name: "Joe", last_name: "Smith", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com")
        expect(user).to be_invalid
      end

      it "is invalid without a unique email" do
        user = User.create(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")
        user_1 = User.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")
        expect(user_1).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a first_name, last_name, password and email" do
        user = User.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", password: "password")
        expect(user).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many classes" do
      user = create(:user)
      expect(user).to respond_to(:klasses)
    end
  end
end
