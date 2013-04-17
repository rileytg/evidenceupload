FactoryGirl.define do
  factory :evidence do
    url 'http://www.example.com/photo.jpeg'
    source Faker::Name::name
  end
end
