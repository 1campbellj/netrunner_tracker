class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :order
      t.boolean :owned
      t.boolean :proxied
      
      t.timestamps
    end
  end
end
