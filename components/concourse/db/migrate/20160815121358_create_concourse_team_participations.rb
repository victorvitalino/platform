class CreateConcourseTeamParticipations < ActiveRecord::Migration
  def change
    create_table :concourse_team_participations do |t|

      t.integer :candidate_participation_id, index: true, index: { name: 'cand_part_id'}

      t.string  :name 
      t.integer :job
      t.string  :observation

      t.timestamps null: false
    end
  end
end
