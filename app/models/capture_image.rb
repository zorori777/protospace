class CaptureImage < ApplicationRecord
  #associtation
  belongs_to :prototype, inverse_of: :capture_images
  #image_uploader
  mount_uploader :content, ImageUploader
  #define user_number for images
  enum role: { main: 0, sub: 1 }
  #validation
  validates :content, presence: true
end
