class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :product_orders, through: :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
