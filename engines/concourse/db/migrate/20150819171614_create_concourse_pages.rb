class CreateConcoursePages < ActiveRecord::Migration
  def change
    create_table :concourse_pages do |t|
      t.references :project, index: true#, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :publish
      t.string :slug

      t.timestamps null: false
    end
    add_index :concourse_pages, :slug, unique: true
  end
end
