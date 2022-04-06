FactoryBot.define do
  factory :invitation do
    email { "MyString@gmail.com" }
    message { "MyMessage" }
    association :cycle
    name { "MyName" }
  end
end
