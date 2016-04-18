FactoryGirl.define do
  factory :tag do

    factory :rails_tag do
      tag_name 'Rails'
    end

    factory :java_tag do
      tag_name 'Java'
    end
  end
end