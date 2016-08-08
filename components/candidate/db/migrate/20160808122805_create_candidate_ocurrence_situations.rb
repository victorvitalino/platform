class CreateCandidateOcurrenceSituations < ActiveRecord::Migration
  def change
    create_table :candidate_ocurrence_situations do |t|

      t.string  :name
      t.string  :description
      t.string  :color
      t.boolean :status, default: true
      t.boolean :visible_portal, default: true
      t.string  :label_portal
      
      t.timestamps null: false
    end
  end
end
