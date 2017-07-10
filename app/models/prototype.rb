class Prototype < ApplicationRecord
  #validation
  validates :title, :catch_copy, :concept, presence: true
  #association
  belongs_to :user
  has_many   :capture_images, inverse_of: :prototype, dependent: :destroy
  has_many   :comments
  has_many   :likes
  #making nested_form
  accepts_nested_attributes_for :capture_images
  # Use like function
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end
end
