FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname               { '片仮名'}
    first_name            { '片仮名'}
    surname_reading       { 'カタカナ'}
    first_name_reading    { 'カタカナ'}
    date_of_birth         {Faker::Date.in_date_period}
  end
end
