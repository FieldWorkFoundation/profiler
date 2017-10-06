class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
      t.string :label, null: false
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
