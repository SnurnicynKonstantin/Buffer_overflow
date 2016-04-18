namespace :calculate do
  desc "calculate user rating"
  task :calculate_user_rating => :environment do
    UserRatingCalculator.calculate
  end
end