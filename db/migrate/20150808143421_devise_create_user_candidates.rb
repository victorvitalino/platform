class DeviseCreateUserCandidates < ActiveRecord::Migration
  def change
    create_table(:user_candidates) do |t|
      ## Database authenticatable
      t.string :username,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.integer :account_id
      t.string  :account_type
      t.text    :unique_session_id, :limit => 1
      

      t.timestamps null: false
    end

    add_index :user_candidates, :username,  unique: true
    add_index :user_candidates, :reset_password_token, unique: true
    add_index :user_candidates, [:account_id, :account_type]
   
    # add_index :candidates, :confirmation_token,   unique: true
    # add_index :candidates, :unlock_token,         unique: true
  end
end
