Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'services', to: 'welcome#services'
  get '/about_us', to: 'welcome#about_us'
  get 'schedule', to: 'welcome#schedule'
end
