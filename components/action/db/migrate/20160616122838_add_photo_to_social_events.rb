class AddPhotoToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :photo, :string
  end
end
