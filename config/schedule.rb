every 3.minutes do
  runner "UserRatingCalculator.calculate"
  rake "calculate:calculate_user_rating"
end