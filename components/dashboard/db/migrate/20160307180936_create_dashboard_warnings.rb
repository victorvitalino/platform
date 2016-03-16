class CreateDashboardWarnings < ActiveRecord::Migration
  def change
    create_table :dashboard_warnings do |t|
      t.string :title
      t.text :content
      t.text :resume
      t.boolean :publish
      t.date :date
      t.boolean :status
      t.integer :category
      t.integer :color
      t.string :thumbnail
      t.timestamps null: false
    end
  end
end
