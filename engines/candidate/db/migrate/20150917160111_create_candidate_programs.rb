class CreateCandidatePrograms < ActiveRecord::Migration
  def change
    create_table :candidate_programs do |t|
      t.string :name
      t.boolean :status
      t.integer :code, unique: true

      t.timestamps null: false
    end
  end
end
