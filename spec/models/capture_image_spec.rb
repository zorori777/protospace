require 'rails_helper'

describe CaptureImage do
  describe '#create' do
    describe 'validation' do
      context 'valid date' do
        let(:image){ create(:capture_image, :main) }
        it "is valid CaptureImage" do
          image.valid?
          expect(image).to be_valid
        end
      end
      context 'invalid date' do
        let(:image_without_role) { build(:capture_image, role: '') }
        it "is invalid without a role" do
          image_without_role.valid?
          expect(image_without_role.errors[:role]).to include("を入力してください。")
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
      let!(:content_invalid_format) { build(:capture_image, :main, :invalid_format) }
      it "has the invalid content format" do
        content_invalid_format.valid?
        expect(content_invalid_format.errors[:content]).to include("rmagickがファイルを処理できませんでした。画像を確認してください。")
      end
    end
  end
end
