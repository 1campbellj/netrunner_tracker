class Cycle < ApplicationRecord
  has_many :packs
  has_many :cards, through: :packs
end
