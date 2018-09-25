class Label < ApplicationRecord
	validates :name, presence: true, length: {in: 1..255}
end