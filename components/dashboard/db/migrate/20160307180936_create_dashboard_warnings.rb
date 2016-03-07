class CreateDashboardWarnings < ActiveRecord::Migration
  def change
    create_table :dashboard_warnings do |t|
      t.string :title
      t.text :content
      t.text :resume
      t.boolean :publish
      t.date :data
      t.boolean :status

      t.timestamps null: false
    end
  end
end
