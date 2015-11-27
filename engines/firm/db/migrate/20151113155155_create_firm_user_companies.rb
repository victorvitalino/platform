class CreateFirmUserCompanies < ActiveRecord::Migration
  def change
    create_table :firm_user_companies do |t|
      t.string :name
      t.string :email
      t.string :login_user
      t.string :password
      t.boolean :admin
      t.references :company, index: true#, foreign_key: true
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
