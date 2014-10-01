class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id, null: false
      t.string :uid, limit: 127
      t.string :provider, limit: 127
      t.string :nickname
      t.string :access_token
      t.string :access_secret
      t.timestamps
    end
  end
end
