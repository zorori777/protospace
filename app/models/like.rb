class Like < ApplicationRecord
 #validation
 belongs_to :user
 belongs_to :prototype, counter_cache: :likes_count
end
