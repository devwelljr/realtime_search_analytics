class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :text
      t.integer :count, default: 0

      t.timestamps
    end

    add_index :searches, :text
  end
end
