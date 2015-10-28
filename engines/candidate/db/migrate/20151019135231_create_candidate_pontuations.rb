class CreateCandidatePontuations < ActiveRecord::Migration
  def change
    create_table :candidate_pontuations do |t|
      t.references :cadastre, index: true
      t.references :cadastre_mirror, index: true
      t.integer    :code
      t.float      :bsb
      t.float      :dependent
      t.float      :timelist
      t.float      :special_condition
      t.float      :income
      t.float      :total
      t.references :program, index: true
      t.references :situation_status, index: true

      t.timestamps null: false
    end

  end
end
