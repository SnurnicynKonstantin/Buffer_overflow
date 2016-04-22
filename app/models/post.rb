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

  def self.vote_for_post(value, post, user)#рефактор
    rating = Postratings.new(user_id: user.id,
                             post_id: post.id,
                             value: value)
    if rating.save
      ratings = Postratings.where(post_id: post.id)
      rating = 0
      ratings.each_with_index { |val,index|
        rating += val.value.to_f
        rating /= index + 1 if(index == ratings.size - 1)}
    end
    post.update_attributes(rating: rating)
    rating
  end

end