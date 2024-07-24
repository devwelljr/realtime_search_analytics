FactoryBot.define do
  factory :saved_search do
    search_id { 1 }
    search_count { 2 }
    ip_address { "123.45.67.89" }
  end
end
