class Keyboard < ApplicationRecord
	validates :price, :brand, presence: true
	validates :brand, uniqueness: true

end
