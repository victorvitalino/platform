class CreateCandidateLists < ActiveRecord::Migration
  def change
    create_table :candidate_lists do |t|
      t.string :title
      t.string :condition_sql
      t.integer :list_type, default: 0
      t.string :view_target
      t.boolean :publish
      t.boolean :cpf_filter, default: false
      t.boolean :name_filter, default: false
      t.boolean :income_filter, default: false
      t.string  :slug
      t.timestamps null: false
    end

    add_index :candidate_lists, :slug, unique: true
  end
end
