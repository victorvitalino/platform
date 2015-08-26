class CreateConcourseNavs < ActiveRecord::Migration
  def change
    create_table :concourse_navs do |t|
      t.references :project, index: true#, foreign_key: true
      t.references :page, index: true#, foreign_key: true
      t.string  :label
      t.string :url
      t.integer :target
      t.integer :action
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
