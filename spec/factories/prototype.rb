FactoryGirl.define do

  factory :prototype do
    title                  { Faker::Pokemon.name }
    catch_copy             { Faker::Cat.name }
    concept                { Faker::Lorem.sentence }
    created_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    user
  end
  trait :with_comments do
    transient do
      comments_count 5
    end
    after(:create) do |prototype, evaluator|
      prototype.comments << create_list(:comment, evaluator.comments_count)
    end
  end

  trait :with_likes do
    transient do
      likes_count 5
    end
    after(:create) do |prototype, evaluator|
      prototype.likes << create_list(:like, evaluator.likes_count)
    end
  end
end

