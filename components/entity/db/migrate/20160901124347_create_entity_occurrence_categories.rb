class CreateEntityOccurrenceCategories < ActiveRecord::Migration
  def change
    create_table :entity_occurrence_categories do |t|

      t.string  :name
      t.string  :description
      t.boolean :status, default: true
      
      t.timestamps null: false
    end
  end
end
