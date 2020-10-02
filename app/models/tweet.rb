class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :field
  belongs_to_active_hash :level

  with_options presence: true do
    validates :image
    validates :price, format: { with:/\A[0-9]+\z/}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/}do
      validates :title
      validates :place
    end
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :prefecture_id
      validates :field_id
      validates :level_id
    end
  end
end