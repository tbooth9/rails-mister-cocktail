class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  # because it has both ids stored as attributes

  validates :description, uniqueness: { scope: :ingredient}
end
