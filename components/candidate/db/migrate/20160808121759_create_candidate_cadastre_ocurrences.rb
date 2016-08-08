class CreateCandidateCadastreOcurrences < ActiveRecord::Migration
  def change
    create_table :candidate_cadastre_ocurrences do |t|
      
      t.integer :cadastre_id,             index: true
      t.integer :ocurrence_situation_id,  index: true
      t.integer :ocurrence_type_id,       index: true
      t.integer :attendance_id,           index: true
      t.integer :program_id,              index: true
      
      t.boolean   :solved,                     default: false
      t.integer   :feedback_staff_id,          index: true
      t.text      :feedback_observation
      t.string    :feedback_archive
      t.datetime  :feedback_datetime

      t.boolean :visible_portal,          default: true
      t.boolean :default_label,           default: true
      t.string  :custom_label

      t.timestamps null: false
    end
  end
end
