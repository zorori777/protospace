class CaptureImage < ApplicationRecord
  #associtation
  belongs_to :prototype
  #image_uploader
  mount_uploader :content, ImageUploader
  #define user_number for images
  enum role: { main: 0, sub: 1 }
  #validation
  validates :content, presence: true, allow_blank: true
end
