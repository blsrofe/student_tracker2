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

    it "has many observations" do
      user = create(:user)
      expect(user).to respond_to(:observations)
    end
  end

  describe "user signs in with oauth" do
    it "creates or updates itself from an oauth hash" do
      auth = {
              provider: "google",
              uid: "12345678910",
              info: {
                    email: "jim@gmail.com",
                    first_name: "Jim",
                    last_name: "Scott"
                    },
              credentials: {
                            token: "abcede439439",
                            refresh_token: "123434fkdjfdkj",
                            expires_at: DateTime.now
                            }
              }
      user = User.from_oauth(auth)

      expect(user.provider).to eq("google")
      expect(user.uid).to eq("12345678910")
      expect(user.email).to eq("jim@gmail.com")
      expect(user.first_name).to eq("Jim")
      expect(user.last_name).to eq("Scott")
      expect(user.token).to eq("abcede439439")
      expect(user.refresh_token).to eq("123434fkdjfdkj")
    end
  end
end
