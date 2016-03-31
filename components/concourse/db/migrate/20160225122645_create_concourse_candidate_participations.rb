class CreateConcourseCandidateParticipations < ActiveRecord::Migration
  def change
    create_table :concourse_candidate_participations do |t|
      t.references :candidate, index: true#, foreign_key: true
      t.text   :team_description
      t.string :archive_one
      t.string :archive_two
      t.string :archive_three
      t.string :archive_four
      t.string :archive_five

      t.timestamps null: false
    end
  end
end
