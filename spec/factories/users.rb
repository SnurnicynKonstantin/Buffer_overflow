FactoryGirl.define do
  factory :user do
    password              '12345678'
    password_confirmation '12345678'

    factory :first_user do
      name  'Samsung'
      surname 'Samsing'
      nick  'Samsung'
      email 'samsung@mail.ru'
    end

    factory :second_user do
      name  'jonny'
      surname 'jonny'
      nick  'jonny'
      email 'john@mail.ru'
    end
  end
end