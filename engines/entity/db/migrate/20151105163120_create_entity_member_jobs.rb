class CreateEntityMemberJobs < ActiveRecord::Migration
  def change
    create_table :entity_member_jobs do |t|
      t.string :name 
      t.integer  :code
      t.boolean :status, default: true
      t.timestamps null: false
    end
    add_index :entity_member_jobs, :code, unique: true
  end
end
