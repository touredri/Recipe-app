# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Drissa' }
    email { Faker::Internet.unique.email }
    password { 'password' }
  end
end
