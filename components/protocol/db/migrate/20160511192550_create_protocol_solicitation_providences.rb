class CreateProtocolSolicitationProvidences < ActiveRecord::Migration
  def change
    create_table :protocol_solicitation_providences do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
