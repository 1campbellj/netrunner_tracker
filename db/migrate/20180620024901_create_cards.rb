class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :packs
      t.references :boxes
      t.string :order
      t.string :name
      t.boolean :owned
      t.bolean :proxied
      
      t.timestamps
    end
  end
end
