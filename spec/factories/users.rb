FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }

    password_confirmation { password }
    first_name            { '名字' }
    last_name             { '名前' }
    date_of_birth { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
    last_name_kana { 'ミョウジ' }
    first_name_kana { 'ナマエ' }
  end
end
