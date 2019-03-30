class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: { maximum: 6 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true

  # かなのみの入力
  VALID_KANA_REGEX = /\A[ぁ-ん]+\z/
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'かなで入力してください'}
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: 'かなで入力してください'}

# 誕生年は1900年以降のみに限定
  VALID_YEAR_REGEX = /\A19[0-9]{2}|[2-9][0-9]{3}\z/
  validates :birthday_year, presence: true, format: { with: VALID_YEAR_REGEX, message: '1900年以降で入力してください'}

# 誕生月は12月のうちのどれか
  validates :birthday_month, presence: true, numericality: {
        greater_than_or_equal_to: 1,
        less_than: 12
      }

# 誕生日は31日のうちのどれか
  validates :birthday_day, presence: true, numericality: {
        greater_than_or_equal_to: 1,
        less_than: 31
      }

# 郵便番号は〒123-1234の形
  VALID_POSTCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  validates :postcode, presence: true, format: { with: VALID_POSTCODE_REGEX, message: '123-1234の形で入力してください'}

  has_many :items

