class AddThumbToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :thumb, :string
  end
end
