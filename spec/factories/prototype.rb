FactoryGirl.define do

  factory :prototype do
    title                  { Faker::Pokemon.name }
    catch_copy             { Faker::Cat.name }
    concept                { Faker::Lorem.sentence }
    created_at { Faker::Time.between(2.days.ago, Date.today, :all) }
    user
  end
end

