class CreateConcourseProjects < ActiveRecord::Migration
  def change
    create_table :concourse_projects do |t|
      t.string :title
      t.text :mini_description
      t.text :apresentation
      t.date :start
      t.date :end
      t.boolean :publish
      t.boolean :status
      t.string :image_header
      t.string :image_logo
      t.string :image_footer
      t.string :image_slider
      t.boolean :slider
      t.boolean :consultation
      t.string  :slug, unique: true
      t.integer :step, default: 0

      t.timestamps null: false
    end
  end
end
