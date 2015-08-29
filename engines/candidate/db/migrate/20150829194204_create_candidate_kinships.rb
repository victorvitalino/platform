class CreateCandidateKinships < ActiveRecord::Migration
  def change
    create_table :candidate_kinships do |t|
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
