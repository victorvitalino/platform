class CreateConcourseFields < ActiveRecord::Migration
  def change
    create_table :concourse_fields do |t|
      t.references :subscribe, index: true#, foreign_key: true
      t.references :participation, index: true#, foreign_key: true
      t.string :label
      t.integer :field_type
      t.boolean :required
      t.boolean :unique
      t.integer :max_size
      t.string :file_white_list
      t.boolean :only_number

      t.timestamps null: false
    end
  end
end
