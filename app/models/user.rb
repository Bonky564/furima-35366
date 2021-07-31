class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :nickname, presence: true
  validates :surname, presence: true
  validates :first_name, presence: true
  validates :surname_reading, presence: true
  validates :first_name_reading, presence: true
  validates :date_of_birth, presence: true
end
