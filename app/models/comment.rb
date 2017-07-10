class Comment < ApplicationRecord
  # validation
  belongs_to :user
  belongs_to :prototype
end
