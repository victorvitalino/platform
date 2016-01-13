class CreateEntityMessages < ActiveRecord::Migration
  def change
    create_table :entity_messages do |t|
      t.references :cadastre, index: true#, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
