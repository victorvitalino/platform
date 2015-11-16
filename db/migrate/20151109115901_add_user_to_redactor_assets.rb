class AddUserToRedactorAssets < ActiveRecord::Migration
  def change
    add_reference :redactor_assets, :user, index: true
  end
end
