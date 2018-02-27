class CreatePostDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :post_details do |t|
      t.string :front
      t.float :entrance
      t.string :house_direction
      t.string :balcony_direction
      t.integer :floor
      t.integer :bedroom
      t.integer :toilet
      t.text :furniture
      t.string :contact_name
      t.string :contact_address
      t.string :contact_phone
      t.string :contact_mobile
      t.string :contact_mail

      t.timestamps
    end
  end
end
