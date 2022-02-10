class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.index :name, unique: true

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :countries, :deleted_at
  end
end
