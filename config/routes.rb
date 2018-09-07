Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'projects/index'

  resources :projects do
  	resources :todos
  end

  root 'projects#index'
end
