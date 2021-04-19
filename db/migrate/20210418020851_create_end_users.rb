class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_kana_name
      t.string :first_kana_name
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.boolean :is_deleted, default: "false"
      t.timestamps
    end
  end
end
