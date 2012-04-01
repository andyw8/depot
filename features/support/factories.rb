FactoryGirl.define do
  factory :product do
    sequence(:title) {|n| "My Title #{n}" }
    description "My Description"
    image_url "/assets/cs.jpg"
    created_at { Time.now }
    updated_at { Time.now }
    price 9.99
  end
end
