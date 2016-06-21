class AddDistrictToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :district, :string
  end
end
