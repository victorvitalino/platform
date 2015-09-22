class CreateCandidateAttendanceCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_attendance_cadastres do |t|
      t.references :attendance_status, index: true
      t.references :attendant, index: true
      t.boolean    :status, default: false
      t.timestamps null: false
    end
  end
end
