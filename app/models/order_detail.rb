class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, presence: true, numericality: {greater_than: 0}
end
