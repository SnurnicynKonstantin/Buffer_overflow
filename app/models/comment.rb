class Comment < ActiveRecord::Base
  validates :text, presence: true,
                   length: { in: 2..400 }

  belongs_to :user
  belongs_to :post, counter_cache: true

  after_create :update_post
  acts_as_voteable

  private

  def update_post
    self.post.touch
  end
end