class CreateCandidateZones < ActiveRecord::Migration
  def change
    create_table :candidate_zones do |t|
      t.string  :name
      t.float   :start_value, default: 0
      t.float   :end_value,   default: 0
      t.string  :code
      t.boolean :status

      t.timestamps null: false
    end

    add_index :candidate_zones, :code, unique: true
  end
end
