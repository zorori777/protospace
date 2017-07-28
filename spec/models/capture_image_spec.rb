require 'rails_helper'

describe CaptureImage do
  describe '#create' do
    describe 'validation' do
      context '有効なデーターの時' do
        let(:image){ create(:capture_image, :main) }
        it "CaptureImageが有効な時" do
          image.valid?
          expect(image).to be_valid
        end
      end
      context '無効なデーターの時' do
        let(:image_without_role) { build(:capture_image, role: '') }
        it "roleが空欄のとき" do
          image_without_role.valid?
          expect(image_without_role.errors[:role]).to include("を入力してください。")
        end
      end
    end

    describe 'association' do
      let!(:prototype) { create(:prototype) }
      let(:image){ create(:capture_image, :main, prototype: prototype) }
      it "prototypeとの関連性" do
        expect(image.prototype).to eq prototype
      end
    end

    describe 'valid_image_format' do
      let!(:content_invalid_format) { build(:capture_image, :main, :invalid_format) }
      it "画像の有効なformat" do
        content_invalid_format.valid?
        expect(content_invalid_format.errors[:content]).to include("rmagickがファイルを処理できませんでした。画像を確認してください。")
      end
    end
  end
end
