class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post, counter_cache: true

  has_many :inserted_comment, class_name: 'Comment',
           foreign_key: 'root_comment_id'
  belongs_to :root_comment,   class_name: 'Comment'

  validates :text, presence: true,
                   length: { in: 2..400 }

  after_create :update_post
  acts_as_voteable

  private

  def update_post
    self.post.touch if self.post.present?
  end
end