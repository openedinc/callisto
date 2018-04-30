require_relative 'settings'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:registrations, :passwords]
      get :assessment_events, to: 'assessment_events#index'
      get :assessment_item_events, to: 'assessment_item_events#index'
      get :grade_events, to: 'grade_events#index'
      get :media_events, to: 'media_events#index'
    end
  end

  if Settings.active_admin_enabled?
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
