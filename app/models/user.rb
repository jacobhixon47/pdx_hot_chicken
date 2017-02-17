class User < ApplicationRecord
  has_many :reviews
  has_many :products, through: :reviews
  
  validates :username, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
