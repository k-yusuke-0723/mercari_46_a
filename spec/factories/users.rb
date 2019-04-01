FactoryBot.define do

  factory :user do
    nickname              {"smith"}
    email                 {"e@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    last_name             {"sumikawa"}
    first_name            {"yusuke"}
    last_name_kana        {"すみかわ"}
    first_name_kana       {"ゆうすけ"}
    birthday_year         {"1991"}
    birthday_month        {"7"}
    birthday_day          {"8"}
    postcode              {"123-1234"}
    prefecture            {"osaka"}
    city                  {"osakacity"}
    block                 {"1-1-123"}
    building              {"yutaka"}
    phone_number          {"090-2222-1111"}
    point                 {"0"}
    point_exp_date        {"0"}
    biography             {"Hello"}
    user_image            {"0"}
  end

end
