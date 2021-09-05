class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building_name, :telephone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :city
    validates :house_num
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :telephone_num, length: {maximum: 11 }, format: { with: /\A[0-9]+\z/ }
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building_name: building_name, telephone_num: telephone_num, buy_id: buy.id)
  end
end