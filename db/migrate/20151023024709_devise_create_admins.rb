class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Lockable
      t.integer :failed_attempts, default: 0, null: false
      t.datetime :locked_at
      
      # User contact info
      t.string :name
      t.string :phone_number
      t.string :github

      t.timestamps null: false
    end

    add_index :admins, :email,                unique: true
  end
end
