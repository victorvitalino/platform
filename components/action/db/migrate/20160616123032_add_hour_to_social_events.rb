class AddHourToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :hour, :string
  end
end
