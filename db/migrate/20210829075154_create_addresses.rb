class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer    :prefecture_id,   null: false
      t.references :buy,             null: false, foreign_key: true
      t.string     :postal_code,     null: false
      t.string     :city,            null: false
      t.string     :house_num,       null: false
      t.string     :telephone_num,   null: false
      t.string     :building_name
      t.timestamps
    end
  end
end