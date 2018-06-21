class Pack < ApplicationRecord
  belongs_to :cycle
  has_many :cards
end
