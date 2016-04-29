class Post_rating < ActiveRecord::Base
  validates :post_id, uniqueness: {scope: :user_id}
  validates :value, inclusion: { in: [1,2,3,4,5], message: "%{value} is not a valid vote" }
end