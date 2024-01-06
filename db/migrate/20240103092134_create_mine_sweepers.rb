class CreateMineSweepers < ActiveRecord::Migration[7.1]
  def change
    create_table :mine_sweepers do |t|
      t.string :name
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mines
      t.jsonb :board, null: false, default: []

      t.timestamps
    end
  end
end
