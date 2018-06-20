class CreatePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.string :name
      t.numeric :cycle_id

      t.timestamps
    end
  end
end
