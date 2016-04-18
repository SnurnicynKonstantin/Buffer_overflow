FactoryGirl.define do
  factory :post do

    factory :first_post do
      title 'title1'
      text 'text1'
      user_id 1
    end

    factory :second_post do
      title 'title2'
      text 'text2'
      user_id 2
    end
  end
end