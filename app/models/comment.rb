class Comment < ActiveRecord::Base
  validates :text, presence: true,
                   length: { in: 2..400 }

  belongs_to :user
  belongs_to :post, counter_cache: true

  acts_as_voteable
end