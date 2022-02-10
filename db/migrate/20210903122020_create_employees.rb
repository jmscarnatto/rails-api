class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :project_id, :default=>1
      t.integer :country_id
      t.integer :role_id

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :employees, :deleted_at
  end
end
