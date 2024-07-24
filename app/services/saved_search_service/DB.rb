module SavedSearchService
  class DB
    def initialize(params, ip_address)
      @params = params
      @ip_address = ip_address
    end

    def create
      search = create_search
      saved = SavedSearch.create(ip_address: @ip_address, search: search)

      saved
    end

    def create_search
      query = normalize_search(@params[:query])
      search = Search.find_or_create_by(text: query)
      search.increment!(:count)

      search
    end

    private

    def normalize_search(search)
      search.to_s.strip.downcase
    end
  end
end
