class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :projects, :deleted_at
  end
end
