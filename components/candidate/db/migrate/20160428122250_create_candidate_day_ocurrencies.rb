class CreateCandidateDayOcurrencies < ActiveRecord::Migration
  def change
    create_table :candidate_day_ocurrencies do |t|
      t.integer :update_income, default: 0
      t.integer :update_dependent, default: 0
      t.integer :update_special_condition, default: 0
      t.integer :update_old, default: 0
      t.integer :halted, default: 0
      t.integer :update_arrival_df, default: 0
      t.integer :enables_day, default: 0
      t.integer :change_zone, default: 0
      t.integer :update_data, default: 0
      t.integer :contemplated_day, default: 0
      t.date    :date_ocurrency

      t.timestamps null: false
    end
  end
end
