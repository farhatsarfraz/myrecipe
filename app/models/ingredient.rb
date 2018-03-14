class Ingredient < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 23}
    validates_uniqueness_of :name
    has_many :recipe_ingredients
    has_many :recipe, through: :recipe_ingredients
end