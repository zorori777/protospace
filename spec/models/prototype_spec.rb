require 'rails_helper'

describe Prototype do
  describe '#create' do
    describe 'validation' do
      let(:prototype) { build(:prototype) }
      let(:prototype_without_title) { build(:prototype, title: '') }
      let(:prototype_without_catch_copy) { build(:prototype, catch_copy: '') }
      let(:prototype_without_concept) {build(:prototype, concept: '') }

      context 'valid data' do
        it 'is valid prototype' do
          expect(prototype).to be_valid
        end
      end

      context 'invalid data' do
        it "is invalid without a title" do
          prototype_without_title.valid?
          expect(prototype_without_title.errors[:title]).to include("can't be blank")
        end

        it "is invalid without a catch_copy" do
          prototype_without_catch_copy.valid?
          expect(prototype_without_catch_copy.errors[:catch_copy]).to include("can't be blank")
        end

        it "is invalid without a concept" do
          prototype_without_concept.valid?
          expect(prototype_without_concept.errors[:concept]).to include("can't be blank")
        end
      end
    end

    describe 'associations' do
      let(:user) { create(:user) }
      let(:prototype) { create(:prototype, user: user)}
      context 'associated with user' do
         it "is associated with user" do
          prototype = create(:prototype, user: user)
          expect(prototype.user).to eq user
        end
      end

      context 'associated with comments' do
        let!(:prototype) { create(:prototype, :with_comments) }
        it 'deletes the comments when prototype is deleted' do
          expect{ prototype.destroy }.to change { Comment.count }.by(-5)
        end
      end

      context 'associated with likes' do
        let!(:prototype) { create(:prototype, :with_likes) }
        it 'delete the likes when prototype is deleted' do
          expect{ prototype.destroy }.to change { Like.count }.by(-5)
        end
      end
    end

    describe '#posted_date' do
      it "returns dates in a specified format" do
        prototype = build(:prototype, created_at: '2017-07-07')
        expect(prototype.posted_date).to eq 'Jul 07'
      end
    end
  end
end
