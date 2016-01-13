class CreateEntityMemberAdditionals < ActiveRecord::Migration
  def change
    create_table :entity_member_additionals do |t|
      t.string :cnpj
      t.string :social_reason
      t.references :member_job, index: true
      t.date :start
      t.date :end
      t.references :member, index: true

      t.timestamps null: false
    end
  end
end
