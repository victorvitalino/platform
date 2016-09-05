class AddReportToSocialEvents < ActiveRecord::Migration
  def change
    add_column :action_social_events, :report, :string
  end
end
