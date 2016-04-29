class UserRatingCalculator

  def self.calculate
    log = Logger.new("#{Rails.root}/log/rating.log")
    User.all.each do |user|
      rating = 0
      Vote.all.each do |vote|
        comment_id = vote.voteable_id
        rating += 1 if user.comments(comment_id).exists?
        log.info("User with id: #{user.id} get rating: #{rating}")
      end
      unless user.rating == rating
        user.update_attributes(rating: rating)
        log.info("User with id: #{user.id} get rating: #{rating}")
      end
    end

  end
end