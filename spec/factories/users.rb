FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    date_of_birth         { Faker::Date.birthday}

  end
end
