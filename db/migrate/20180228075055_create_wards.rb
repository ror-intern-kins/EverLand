class CreateWards < ActiveRecord::Migration[5.1]
  def change
    create_table :wards do |t|
      t.string :name
      t.belongs_to :districts

      t.timestamps
    end
  end
end
