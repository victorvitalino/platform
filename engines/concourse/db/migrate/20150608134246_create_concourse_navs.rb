class CreateConcourseNavs < ActiveRecord::Migration
  def change
    create_table :concourse_navs do |t|
      t.string :name
      t.references :page, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.string :external_url
      t.integer :target
      t.integer :action
      t.references :father, index: true
      t.boolean :publish
      t.integer :order
      t.timestamps null: false
    end
  end
end
