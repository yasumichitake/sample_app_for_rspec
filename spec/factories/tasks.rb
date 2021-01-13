FactoryBot.define do
  factory :task do
    association :user
    title { "title" }
    content { "content" }
    status { 0 }
  end
end

# FactoruBotでの定義づけは{}ブロックで囲む必要がある
