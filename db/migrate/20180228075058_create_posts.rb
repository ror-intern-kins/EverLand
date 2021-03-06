class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :category
      t.belongs_to :city
      t.belongs_to :district
      t.belongs_to :ward
      t.belongs_to :street
      t.string :address_number
      t.text :description
      t.string :project
      t.decimal :area
      t.decimal :price
      t.string :unit
      t.float :lng
      t.float :lat
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
      t.belongs_to :user      

      t.timestamps
    end
  end
end
