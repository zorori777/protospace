class Prototype < ApplicationRecord
  #validation
  validates :title, :catch_copy, :concept, presence: true
  #association
  belongs_to :user
  has_many   :capture_images, inverse_of: :prototype
  #making nested_form
  accepts_nested_attributes_for :capture_images
end