Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :assessment_events
  resources :media_events
  resources :caliper_events do
    collection do
      get 'clear'
    end
  end
  resources :grade_events
  resources :assessment_item_events
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
