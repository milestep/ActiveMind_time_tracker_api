FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        username  { Faker::Name.name }
        is_admin { Faker::Boolean.boolean(true_ratio: 0.2) }
        password { Faker::Internet.password }
    end
end