Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :tags
  resources :posts do
    member do
      post :vote_up
    end
    resource :comments do
      member do
        post :vote_up
      end
    end
  end

  get '/statistic/:id', to: 'statistics#tag_statistic', as: :tag_statistic
  get '/:id/edit', to: 'users#edit'
  get '/search',   to: 'search#index',  as: :search_page
  post '/search',   to: 'search#search', as: :search_post
  get '/:id',      to: 'users#show',    as: :user_shot
  get '/change_locale/:locale', to: 'sessions#change_locale', as: :change_locale
end
