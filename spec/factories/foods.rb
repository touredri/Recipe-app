# frozen_string_literal: true

FactoryBot.define do
  factory :food do
    name { 'Carrot' }
    measurement_unit { 'piece' }
    price { 2 }
    quantity { 10 }
    association :user
  end
end
