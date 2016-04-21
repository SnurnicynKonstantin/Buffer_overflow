class Post < ActiveRecord::Base
  scope :recent, ->     {order(updated_at: :desc)}
  scope :uncommented, ->{where(comments_count: 0)}


  validates :title, presence: true,
                    length: { in: 2..50 }
  validates :text,  presence: true,
                    length: { in: 2..1000 }

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :tags
end