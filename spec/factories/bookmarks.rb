FactoryGirl.define do
  factory :bookmark do
    url 'http://www.apple.com'
    association :topic
  end
end
