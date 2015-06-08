class CreateConcoursePages < ActiveRecord::Migration
  def change
    create_table :concourse_pages do |t|
      t.string :title
      t.text :content
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
