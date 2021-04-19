class Address < ApplicationRecord

  belongs_to :end_user

  # 下記カラムは埋まってないとダメ
  validates :name, :postal_code, :address,
            presence: true
  # 郵便番号は整数型で７文字でないとダメ
  validates :postal_code, numericality: { only_integer: true }, length: {is: 7}
end
