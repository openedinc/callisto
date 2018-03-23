class Api::V1::BaseController < ActionController::API
  before_action :skip_session_storage
  before_action :authenticate_api_v1_user!, unless: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

    def pagination_dict(collection)
      {
        current_page: collection.current_page,
        total_pages: collection.total_pages,
        page_entries: collection.size
      }
    end

    def render_paginated(collection)
      render json: collection, meta: pagination_dict(collection)
    end


    def skip_session_storage
      request.session_options[:skip] = true
    end

end
