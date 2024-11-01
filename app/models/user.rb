class User < ApplicationRecord

  has_many :projects
  has_one :personal_information
  has_many :tools
  has_many :intrests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
