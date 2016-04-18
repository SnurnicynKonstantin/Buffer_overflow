Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :tags
  resources :posts do
    resource :comments do
      member do
        post :vote_up
      end
    end
  end


  get '/:id/edit', to: 'users#edit'
  get '/:id',      to: 'users#show', as: :user_shot
end
