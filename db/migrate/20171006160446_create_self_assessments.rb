class CreateSelfAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :self_assessments do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :self_assessments, :name, unique: true
  end
end
