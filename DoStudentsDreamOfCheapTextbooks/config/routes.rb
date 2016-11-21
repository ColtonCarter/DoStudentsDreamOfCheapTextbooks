Rails.application.routes.draw do
    root 'searches#new'
  resources :searches
  resources :table1_copy3s
  resources :table1_copy2s
  resources :table1_copy1s
  resources :table1s
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
