class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.numeric :pack_id

      t.timestamps
    end
  end
end