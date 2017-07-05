class CaptureImage < ApplicationRecord
  #associtation
  belongs_to :prototype
  #image_uploader
  mount_uploader :image, ImageUploader
end
