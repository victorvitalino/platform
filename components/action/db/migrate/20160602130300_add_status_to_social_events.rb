class AddStatusToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :status, :boolean
  end
end
