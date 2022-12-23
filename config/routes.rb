Rails.application.routes.draw do
   devise_for :admins,skip: [:registrations, :passwords] , controllers: {
        sessions: 'admins/sessions'
      }

  devise_for :users,skip: [:passwords],  controllers: {
        passwords: 'publics/passwords',
        registrations: 'publics/registrations'
      }

  namespace :admins do
    resources :users, :only => [:index,:show,:edit,:update]
  end
  namespace :admins do
    resources :genres, :only => [:index,:edit,:update]
  end
  namespace :admins do
    resources :items, :only => [:index,:new,:create,:show,:edit,:update]
  end
  namespace :admins do
    resources :homes, :only => [:top,:about]
  end
  namespace :admins do
    resources :orders, :only => [:index, :show]
  end
  namespace :admins do
    resources :order_details, :only => [:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/admins/homes/top' => 'admins/homes#top', as: 'about'

  root to: 'admins/homes#top'
end
