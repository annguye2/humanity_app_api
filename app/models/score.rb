class Score < ApplicationRecord
  belongs_to :blackcard
  belongs_to :whitecard
end
