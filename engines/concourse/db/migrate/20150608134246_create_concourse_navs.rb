class CreateConcourseNavs < ActiveRecord::Migration
  def change
    create_table :concourse_navs do |t|
      t.string :link
      t.integer :target
      t.string :external_link
      t.references :page, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.integer :page_action
      t.boolean :publish
      t.integer :order
      t.timestamps null: false
    end
  end
end
