class SavedSearch < ApplicationRecord
  belongs_to :search

  def self.to_consumable_json
    json = []

    all.find_in_batches(batch_size: 1000) do |batch|
      batch.each do |saved_search|
        json << saved_search.to_consumable_json
      end
    end

    json&.sort_by {|saved_search| saved_search[:search_count]}&.uniq { |saved_search| saved_search[:search_id] }&.reverse
  end

  def to_consumable_json
    {
      id: id,
      search_id: search.id,
      search_text: search.text,
      search_count: search.count,
    }
  end
end
