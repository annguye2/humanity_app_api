class Blackcard < ApplicationRecord
  has_many :scores
  has_many :whitecards, through: :scores
end
