class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true
  validates :date_of_birth, presence: true
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-ん]+\z/ }
  validates :email, uniqueness: true
  # has_many :items
  # has_many :orders
end
