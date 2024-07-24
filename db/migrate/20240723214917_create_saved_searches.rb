class CreateSavedSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_searches do |t|
      t.references :search, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end

    add_index :saved_searches, :ip_address
  end
end
