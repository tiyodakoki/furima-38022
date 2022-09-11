FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    first_name            {'日向'}
    last_name             {'翔陽'}
    birth                 {'2001-06-21'}
    first_name_kana       {'ヒナタ'}
    last_name_kana        {'ショウヨウ'}

  end
end