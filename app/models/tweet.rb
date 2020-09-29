class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comment
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :prefectures
  belongs_to_active_hash :field
  belongs_to_active_hash :category
  belongs_to_active_hash :level

  with_options presence: true do
    validates :image
    with_options , format: { with: /\A[ぁ-んァ-ン一-龥]/, \d{1,40}}do
      validates :title
      validates :place
      validates :price
      validates :detail
    end
    with_options numericality: { other_than: 1 } do
      validates :prefectures_id
      validates :field_id
      validates :category_id
      validates :level_id
    end
  end
end