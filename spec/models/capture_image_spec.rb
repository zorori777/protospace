require 'rails_helper'

describe CaptureImage do
  describe '#create' do
    describe 'validation' do
      context 'valid date' do
        it "is valid CaptureImage" do
          image = create(:capture_image, :main)
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

    describe 'association' do
      let!(:prototype) { create(:prototype) }
      let(:image){ create(:capture_image, :main, prototype: prototype) }
      it "is associated with prototype" do
        expect(image.prototype).to eq prototype
      end
    end

    describe 'valid_image_format' do
      let!(:content_wrong_format) { build(:capture_image, :main, :wrong_format) }
      it "has the wrong content format" do
        content_wrong_format.valid?
        expect(content_wrong_format.errors[:content]).to include("translation missing: en.errors.messages.rmagick_processing_error")
      end
    end
  end
end
