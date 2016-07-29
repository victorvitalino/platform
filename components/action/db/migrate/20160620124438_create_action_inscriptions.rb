class CreateActionInscriptions < ActiveRecord::Migration
  def change
    create_table :action_inscriptions do |t|
      t.references :social_event, index: true
      t.references :cadastre, index: true

      t.timestamps null: false
    end
  end
end
