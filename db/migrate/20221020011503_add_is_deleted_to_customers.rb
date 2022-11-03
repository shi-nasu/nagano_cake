class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_deleted, :boolean, default: false

    create_table :customers do |t|
      t.integer :id
      t.string :last_name
      t.string :first_name
      t.string :email
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
