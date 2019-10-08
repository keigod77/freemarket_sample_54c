class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses

  validates :nickname, presence: true, length: { maximum: 20 }
  # validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 7..128 } #英字と数字両方含むも追加
  validates :password_confirmation, presence: true, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :phone_number, presence: true
end
