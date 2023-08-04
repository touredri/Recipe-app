# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { "pawpaw" }
    description { "delicious pawpaw" }
    public { true }
    association :user
    preparation_time { 1 }
    cooking_time { 1.2 }
  end
end
