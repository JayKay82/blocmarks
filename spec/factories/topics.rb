FactoryGirl.define do
  factory :topic do
    sequence(:title, 1) { |n| "Topic - #{n}" }
  end
end
