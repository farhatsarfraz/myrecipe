class Recipe < ApplicationRecord
validates :name, presence: true, length: {minmum: 5,maximum: 500}
belongs_to :chef
validates :chef_id, presence: true
end