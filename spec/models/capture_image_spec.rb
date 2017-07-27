require 'rails_helper'

describe CaptureImage do
  describe '#create' do
    describe 'validation' do
      context 'valid date' do
        it "is valid CaptureImage" do
          image = create(:capture_image)
          image.valid?
          expect(image).to be_valid
        end
      end
      context 'invalid date' do
        let(:image_without_role) { build(:capture_image, role: '') }
        it "is invalid without a role" do
          image_without_role.valid?
          expect(image_without_role.errors[:role]).to include("can't be blank")
        end
      end
    end
  end
end
