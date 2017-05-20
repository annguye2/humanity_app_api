class Whitecard < ApplicationRecord
  has_many :scores
  has_many :blackcards, through: :scores
  # belongs_to :player
end
