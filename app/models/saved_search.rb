class SavedSearch < ApplicationRecord
  belongs_to :search

  def self.to_consumable_json(all)
    json = []

    all.find_in_batches(batch_size: 1000) do |batch|
      batch.each do |saved_search|
        json << saved_search.to_consumable_json
      end
    end

    json
  end

  def to_consumable_json
    {
      id: id,
      search_id: search.id,
      search_text: search.text,  # Corrigido
      search_count: search.count,
    }
  end
end
