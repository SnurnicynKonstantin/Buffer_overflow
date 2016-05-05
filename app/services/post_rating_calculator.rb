class PostRatingCalculator
  def self.calculate(value, post, user)
    rating = PostRating.new(user_id: user.id,
                             post_id: post.id,
                             value: value)
    if rating.save
      ratings = PostRating.where(post_id: post.id)
      rating = 0
      ratings.each_with_index { |val,index|
        rating += val.value.to_f
        rating /= index + 1 if (index == ratings.size - 1)}
    end
    post.update(rating: rating)
    rating
  end
end