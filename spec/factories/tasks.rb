FactoryBot.define do
  factory :task do
    association :user
    sequence (:title, "title_1")
    content { "content" }
    deadline { 1.week.from_now }
    status { :todo }
  end
end

# FactoruBotでの定義づけは{}ブロックで囲む必要がある
