class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :name
      t.string :email
      t.string :phone
      t.date :yob
      t.string :gender
      t.string :address
      t.boolean :personal
      
      t.timestamps
    end
  end
  rails g scaffold Category name:string
  rails g scaffold City name:string
  rails g scaffold District name:string
  rails g scaffold Ward name:string
  rails g scaffold Street name:string
  rails g scaffold Post title:string address_number:string 
                       project:string area:decimal price:decimal unit:string lng:float lat:float
end

