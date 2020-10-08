class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,length: {minimum: 6 },format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :first_name,presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :second_name,presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :second_kana,presence: true,format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday,presence: true

  has_many :tweets
  has_many :comments
end
