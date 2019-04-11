Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/services', to: 'welcome#services'
  get '/about_us', to: 'welcome#about_us'
  get '/schedule', to: 'appointments#new'
  get '/new_car', to: 'cars#new'
  get '/my_profile', to: 'welcome#my_profile'
  post '/delete_car/:id', to: 'cars#destroy'
  get '/admin', to: 'welcome#admin'
  get '/not_admin', to: 'welcome#not_admin'

  devise_scope :user do
    get '/sign_up', to: 'devise/registrations#new'
    get '/sign_in', to: 'devise/sessions#new'
    get '/logout', to: 'devise/sessions#destroy'
    get '/account_settings', to: 'users/registrations#edit'
  end

  resources :cars
  resources :appointments
end
