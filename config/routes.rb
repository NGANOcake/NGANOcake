Rails.application.routes.draw do
   devise_for :admins,skip: [:registrations, :passwords] , controllers: {
        sessions: 'admins/sessions'
      }

  devise_for :users,skip: [:passwords],  controllers: {
        passwords: 'publics/passwords',
        registrations: 'publics/registrations'
      }
  namespace :admins do
    resources :customers, :only => [:index,:show,:edit,:update]
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'admins/homes#top'

  get '/admins/homes/top' => 'admins/homes#top', as: 'about'
end
