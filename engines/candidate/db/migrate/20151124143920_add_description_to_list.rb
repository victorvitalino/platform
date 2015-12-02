class AddDescriptionToList < ActiveRecord::Migration
  def change
    add_column :candidate_lists, :description, :text
  end
end
