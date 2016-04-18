FactoryGirl.define do
  factory :comment do

    factory :first_comment do
      text 'text1'
      user_id 1
      post_id 1
    end

    factory :second_comment do
      text 'text2'
      user_id 2
      post_id 2
    end
  end
end