Rails.application.routes.draw do
   devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        passwords: 'admins/passwords',
        registrations: 'admins/registrations'
      }

  devise_for :users,  controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations'
      }
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admins do
    get 'homes/top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'admins/homes#top'

  get '/admins/homes/top' => 'admins/homes#top', as: 'about'

end
