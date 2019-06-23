class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :product_orders, through: :orders
  has_many :transactions

  validates_presence_of :first_name
  validates_presence_of :last_name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
