class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(facebook google_oauth2)
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

  def self.find_oauth(auth)#既存or新規作成のuserを返す
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else
        password = Devise.friendly_token[0, 20]
        user = User.create!(
          nickname: auth.info.name,
          first_name: "hoge",
          last_name: "hoge",
          first_name_kana: "hoge",
          last_name_kana: "hoge",
          birthday_year: "0",
          birthday_month: "0",
          birthday_day: "0",
          phone_number: "08000001111",
          email: auth.info.email,
          password: password,
          password_confirmation: password
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      end
    end
    return user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
