class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :cart_items
  has_many :addresses

  enum is_deleted: { false: 有効, true: 退会 }

  # 下記カラムは埋まってないとダメ
  validates :last_name, :first_name, :last_kana_name, :first_kana_name,
            :postal_code, :address, :phone_number,
            presence: true
  # 郵便番号は整数型で７文字でないとダメ
  validates :postal_code, numericality: { only_integer: true }, length: {is: 7}
  # 電話番号は整数型でないとダメ
  validates :phone_number, numericality: { only_integer: true }
  # カタカナ入力を確認するバリデーション
  validates :last_kana_name, :first_kana_name,
            format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" }


end
