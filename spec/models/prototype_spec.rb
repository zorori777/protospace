require 'rails_helper'

describe Prototype do
  describe '#create' do
    let(:prototype) { build(:prototype) }
    describe 'validation' do
      let(:prototype_without_title) { build(:prototype, title: '') }
      let(:prototype_without_catch_copy) { build(:prototype, catch_copy: '') }
      let(:prototype_without_concept) {build(:prototype, concept: '') }

      context 'valid date' do
        it 'is valid prototype' do
          expect(prototype).to be_valid
        end
      end

      context 'invalid date' do
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
  end
end