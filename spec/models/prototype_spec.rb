require 'rails_helper'

describe Prototype do
  describe '#create' do
    context 'validation' do
      it "is invalid without title" do
        prototype = build(:prototype, title:  "")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end
    end
  end
end
