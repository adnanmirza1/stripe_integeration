Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'homes#index'
  resources :captain_forms
  get '/captain_account', to: 'homes#captain_account'
  get '/create_account', to: 'accounts#create_account'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
