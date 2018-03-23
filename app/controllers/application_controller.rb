class ApplicationController < ActionController::Base
  include ActionController::Serialization

  protect_from_forgery with: :exception, unless: -> { request.format.json? }
end
