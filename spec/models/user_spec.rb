require 'rails_helper'

describe User do
  describe '#create' do
    let(:user) { build(:user) }
    let(:invalid_user) { build(:invalid_user) }
    let(:user_without_name) { build(:user, name: '') }
    let(:user_without_email) { build(:user, email: '')}
    let(:user_without_password) { build(:user, password: '')}
    let(:user_without_password_confirmation){ build(:user, password_confirmation: '')}
    let(:user_without_profile){ build(:user, profile: '')}


    it "is valid a user" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user_without_name.valid?
      expect(user_without_name.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user_without_email.valid?
      expect(user_without_email.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user_without_password.valid?
      expect(user_without_password.errors[:password]).to include("can't be blank")
    end

    it " is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect( another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without a password_confirmation" do
      user_without_password_confirmation.valid?
      expect(user_without_password_confirmation.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid without a profile" do
      user_without_profile.valid?
      expect(user_without_profile.errors[:profile]).to include("can't be blank")
    end

    it "is invalid with a name that has more than 7 characters" do
      invalid_user
      invalid_user.valid?
      expect(invalid_user.errors[:name]).to include("is too long (maximum is 6 characters)")
    end
  end
end
