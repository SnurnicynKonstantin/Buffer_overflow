class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { in: 2..50 }
  validates :text,  presence: true,
                    length: { in: 2..1000 }

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :tags
end