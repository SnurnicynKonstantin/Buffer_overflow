class UserRatingCalculator

  def initialize
    sdf = {}
  end

  def calculate
    User.all.each do |user|
      rating = 0
      Vote.all.each do |vote|
        user_id = user.id
        comment_id = vote.voteable_id
        rating + 1 if user.comments(comment_id).exists?
      end
      user.rating = rating
      #получить id юзера
      #берем id коммента из votes
      #есть ли у юзера этот коммент?
    end

  end
end