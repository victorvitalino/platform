class CreateCandidateSignedInstruments < ActiveRecord::Migration
  def change
    create_table :candidate_signed_instruments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
