class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
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

  def getFullname
    return (last_name + " " + first_name)
  end

  def self.find_oauth(auth)#既存or新規のuserを返す
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.wehre(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        user = User.create(
          nickname: auth.info.name,
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          first_name_kana: "hoge",
          last_name_kana: "hoge",
          birthday_year: "0",
          birthday_month: "0",
          birthday_day: "0",
          phone_number: "08000001111"
          email: auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
      end
    end
    return user
  end

end
