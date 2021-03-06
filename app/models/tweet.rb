class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments
  belongs_to :user
  
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :field
  belongs_to_active_hash :level
  belongs_to_active_hash :month
  belongs_to_active_hash :day
  belongs_to_active_hash :hour

  with_options presence: true do
    validates :image
    validates :price, format: { with:/\A[0-9]+\z/}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/}do
      validates :title
      validates :place
      validates :address
      validates :item
    end
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :field_id
      validates :level_id
      validates :month_id
      validates :day_id
      validates :hour_id
    end
  end
end