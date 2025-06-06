class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true

  validates :password, format: { with: [a-z] \d}, presence: true            # :'文字と数字を含めなければ登録できない'
  validates :first_name_kana, format: {with: [ァ-ヶ]}, presence: true      # :姓のカナは空欄にできない
  validates :last_name_kana, format: {with: [ァ-ヶ]}, presence: true        # :名カナは空欄にできない
  validates :first_name, format: {with: [ぁ-んァ-ヶ一-龥々ー]}, presence: true          # :姓の漢字は空欄にできない
  validates :last_name, format: {with: [ぁ-んァ-ヶ一-龥々ー]}, presence: true           # :名漢字は空欄にできない
 


  has_many :items
  has_many :orders
end



chat GPT

validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/ }, presence: true            # :'文字と数字を含めなければ登録できない'
  validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true      # :姓のカナは空欄にできない
  validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true       # :名カナは空欄にできない
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true          # :姓の漢字は空欄にできない
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true           # :名漢字は空欄にできない
 