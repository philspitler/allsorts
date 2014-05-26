FactoryGirl.define do
  factory :user do
    name { (0...16).map { ('a'..'z').to_a[rand(26)] }.join }
    salary { rand(100000) }
    bonus { rand(2) == 0 ? false : true }
  end

  factory :post do
    sequence(:title) { |n| "Post #{n} title" }
    sequence(:body) { |n| "Post #{n} body" }
  end
end

