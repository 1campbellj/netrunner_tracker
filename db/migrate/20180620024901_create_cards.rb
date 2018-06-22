class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :pack
      t.references :box
      t.string :order
      t.string :name
      t.boolean :owned
      t.boolean :proxied
      
      t.timestamps
    end
  end
end
