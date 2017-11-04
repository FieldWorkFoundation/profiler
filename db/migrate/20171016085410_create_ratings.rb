class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :profile, foreign_key: true
      t.bigint :assessment_id, null: false
      t.string :assessment_type, null: false
      t.integer :score, null: false, default: 0

      t.timestamps
    end

    add_index :ratings, :assessment_id
  end
end
