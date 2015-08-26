class CreateConcourseConsults < ActiveRecord::Migration
  def change
    create_table :concourse_consults do |t|

      t.text  :content
      t.boolean :status, default: false
      t.boolean :terms_use, default: false
      t.references :project, index: true
      
      t.timestamps null: false 
    end
  end
end
