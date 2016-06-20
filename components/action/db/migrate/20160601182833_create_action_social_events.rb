class CreateActionSocialEvents < ActiveRecord::Migration
  def change
    create_table :action_social_events do |t|
      t.string :name
      t.date :date
      t.text :description
      t.integer :situation
      t.references :localization, index: true
      t.references :city, index: true

      t.timestamps null: false
    end
  end
end
