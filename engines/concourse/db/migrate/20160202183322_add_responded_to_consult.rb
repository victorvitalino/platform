class AddRespondedToConsult < ActiveRecord::Migration
  def change
    add_column :concourse_consults, :responded, :boolean
  end
end
