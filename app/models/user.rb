class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_details, dependent: :destroy
  has_many :orders, dependent: :destroy

  enum admin: { admin: true, customer: false }
end
