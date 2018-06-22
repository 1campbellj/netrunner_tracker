class CreatePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.string :name
      t.references :cycle
      t.string :order
      t.boolean :owned
      t.boolean :proxied

      t.timestamps
    end
  end
end
