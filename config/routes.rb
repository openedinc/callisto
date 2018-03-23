require_relative 'settings'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :assessment_events
      resources :assessment_item_events
      resources :grade_events
      resources :media_events
    end
  end

  if Settings.active_admin_enabled?
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
