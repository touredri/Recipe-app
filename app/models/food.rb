# frozen_string_literal: true

class Food < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :user_id, presence: true
end
