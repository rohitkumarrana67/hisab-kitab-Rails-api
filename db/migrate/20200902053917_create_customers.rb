class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :user_id
      t.string :name
      t.string :email
      t.string :mob
      t.string :address

      t.timestamps
    end
  end
end
