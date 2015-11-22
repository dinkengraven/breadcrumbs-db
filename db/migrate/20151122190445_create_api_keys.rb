class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token, { null: false, unique: true }
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
