FactoryGirl.define do

  factory :capture_image do
    content { Faker::Company.logo }
    prototype

    trait :main do
      role :main
    end

    trait :sub do
      role :sub
    end

    trait :invalid_format do
      content { fixture_file_upload("spec/fixtures/img/takumi.jppg", 'image/jppg') }
    end
  end
end

