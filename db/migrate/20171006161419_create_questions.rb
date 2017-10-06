class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.bigint :assessment_id, null: false
      t.string :assessment_type, null: false
      t.string :label, null: false

      t.timestamps
    end

    add_index :questions, :assessment_id
  end
end
