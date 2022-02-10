class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :clients, :deleted_at
  end
end
