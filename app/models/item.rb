class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :state
  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :title
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
    validates :image
      with_options numericality: { other_than: 1, message: "can't be blank"} do
      validates :category_id
      validates :state_id
      validates :delivery_charge_id 
      validates :prefecture_id
      validates :day_id 
      end
    end
  end
