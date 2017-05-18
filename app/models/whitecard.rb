class Whitecard < ApplicationRecord
  has_many :scores
  has_many :blackcards, through: :scores
end
