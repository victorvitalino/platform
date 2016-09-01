class CreateEntityOccurrences < ActiveRecord::Migration
  def change
    create_table :entity_occurrences do |t|

      t.integer :cadastre_id, index: true
      t.integer :category_id, index: true 
      
      t.text    :description 
      
      t.boolean :solved, default: false
      t.text    :solved_description
      t.integer :solved_user_id, index: true

      t.timestamps null: false
    end
  end
end
