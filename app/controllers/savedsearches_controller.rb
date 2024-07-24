class SavedsearchesController < ApplicationController
  def index
    @saved_searches_by_ip = SavedSearch.where(ip_address: request.remote_ip)

    @saved_searches = SavedSearch.to_consumable_json

    respond_to do |format|
      format.html
    end
  end

  def create
    query = normalize_params(params)
    db_service = SavedSearchService::DB.new(query, request.remote_ip)
    @search = db_service.create

    flash[:notice] = 'Search saved successfully!'
    redirect_to savedsearches_path
  rescue
    flash[:alert] = 'Search was not saved!'
    redirect_to savedsearches_path
  end

  private

  def normalize_params(params)
    params.permit("query")
  end
end
