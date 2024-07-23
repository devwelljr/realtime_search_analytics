class CreateSavedSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_searches do |t|
      t.string :term
      t.string :ip_address

      t.timestamps
    end
  end
end
