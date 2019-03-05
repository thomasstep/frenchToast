Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/services', to: 'welcome#services'
  get '/about_us', to: 'welcome#about_us'
  get '/schedule', to: 'welcome#schedule'

  devise_scope :user do
    get '/sign_up', to: 'devise/registrations#new'
    get '/login', to: 'devise/sessions#new'
    get '/logout', to: 'devise/sessions#destroy'
  end
end
