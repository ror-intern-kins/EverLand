class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :address_number
      t.text :description
      t.string :project
      t.decimal :area
      t.decimal :price
      t.string :unit
      t.float :lng
      t.float :lat

      t.timestamps
    end
  end
end
