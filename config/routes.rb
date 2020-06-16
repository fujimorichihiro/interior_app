Rails.application.routes.draw do

# devise-------------------------------------------
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
# --------------------------------------------------------

  root 'home#top'

  resources :users, only: [:show]

  resources :posts, only: [ :show, :new, :index, :create, :destroy ] do
  	resource :favorites, only: [:create, :destroy]
  end
end
