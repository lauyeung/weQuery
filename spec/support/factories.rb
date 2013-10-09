# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) {|n| "#{n}" }
    sequence(:name) {|n| "person#{n}" }
    oauth_token "token"
    oauth_secret "secret"
  end

  factory :question do
    sequence(:content) {|n| "question content #{n}??" }
    association :user
  end
end
