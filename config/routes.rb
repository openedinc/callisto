Rails.application.routes.draw do
  resources :caliper_events
  resources :outcome_events
  resources :assessment_item_events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
