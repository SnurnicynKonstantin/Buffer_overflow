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
  get '/:id',      to: 'users#show', as: :user_shot
end
