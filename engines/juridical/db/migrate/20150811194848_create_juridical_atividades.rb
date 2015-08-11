class CreateJuridicalAtividades < ActiveRecord::Migration
  def change
    create_table :juridical_atividades do |t|
      t.references :document_type, index: true#, foreign_key: true
      t.references :action_type, index: true#, foreign_key: true
      t.references :local_instance#, index: true, foreign_key: true
      t.date :date_distribution
      t.date :deadline
      t.string :days
      t.date :end_date
      t.text :complemet
      t.references :user, index: true#, foreign_key: true
      t.boolean :status
      t.string :monitoring_type
      t.string :attachment

      t.timestamps null: false
    end
  end
end
