class Whitecard < ApplicationRecord
  has_many :scores
  has_many :blackcards, through: :scores
<<<<<<< HEAD
  # belongs_to :player
=======
  #belongs_to :player
>>>>>>> aafdff6e96d4264886b2134599704e975a256214
end
