class CreateCandidateRegularizationAttendances < ActiveRecord::Migration
  def change
    create_table :candidate_regularization_attendances do |t|
      t.references :adjunct_cadastre, index: true
      t.references :requeriment, index: true 
      t.references :program, index: true
      t.references :station, index: true
      t.references :convocation, index: true
      t.references :attendant, index: true
      t.boolean    :status, default: false
      t.integer    :steṕ, default: 0
      
      t.timestamps null: false
    end
  end
end
