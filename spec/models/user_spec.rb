require 'rails_helper'

describe User do
  describe '#create' do
    let(:user) { build(:user) }

    it "is valid a user" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user.name = ""
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user.email = ""
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user.password = ""
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it " is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect( another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without a password_confirmation" do
      user.password_confirmation = ""
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a profile" do
      user.profile = ""
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    it "is invalid with a name that has more than 7 characters" do
      user.name = "a" * 7
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end

    it "is valid with a name that has less than 6 characters" do
      user.name = "a" * 6
      expect(user).to be_valid
    end
  end
end
