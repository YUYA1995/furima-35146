FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name            {"半田"}
    last_name             {"雄哉"}
    first_name_kana       {"ハンダ"}
    last_name_kana        {"ユウヤ"}
    birthday              {"06/02/1995"}
  end
end
