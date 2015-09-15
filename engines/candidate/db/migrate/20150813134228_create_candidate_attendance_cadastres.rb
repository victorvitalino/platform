class CreateCandidateAttendanceCadastres < ActiveRecord::Migration
  def change
    create_table :candidate_attendance_cadastres do |t|
      t.references :adjunct_cadastre, index: true
      t.references :convocation, index: true
      t.references :attendance_status, index: true
      t.boolean    :status, default: false
      t.references :attendant, index: true
      t.timestamps null: false
    end
  end
end
