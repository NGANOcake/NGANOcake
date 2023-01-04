Rails.application.routes.draw do
  namespace :publics do
    resources :items, :only => [:index, :show]
  end
  namespace :publics do
    get '/users/my_page' => 'users#show', as: 'my_page'
    get 'users/edit'
    get '/users/confirm' => 'users#confirm'
  end
  namespace :publics do
    get 'homes/top'
    get 'homes/about'
  end
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
namespace :publics do
    resources :homes, :only => [:top,:about]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/admins/homes/top' => 'admins/homes#top', as: 'about'

  root to: 'publics/homes#top'
end
