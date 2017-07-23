require 'rails_helper'

describe User do
  describe '#create' do
    let(:user) { build(:user) }
    let(:invalid_user) { build(:invalid_user) }
    let(:blank_name) { user.name = "" }
    let(:blank_email) { user.email = "" }
    let(:blank_password) { user.password = "" }
    let(:blank_password_confirmation) { user.password_confirmation = "" }
    let(:blank_profile) { user.profile = "" }

    it "is valid a user" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      blank_name
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      blank_email
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      blank_password
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
      blank_password_confirmation
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a profile" do
      blank_profile
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    it "is invalid with a name that has more than 7 characters" do
      invalid_user
      invalid_user.valid?
      expect(invalid_user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end
  end
end
