class Comment < ActiveRecord::Base
  validates :text, presence: true,
                   length: { in: 2..400 }

  belongs_to :user
  belongs_to :post

  acts_as_voteable
end