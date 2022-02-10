class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.index :name, unique: true

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :roles, :deleted_at
  end
end
