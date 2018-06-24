Rails.application.routes.draw do
  resources :candidates
  resources :parties
  resources :alliances
  resources :boxes
  resources :elections
  get 'home/index'

  devise_for :users
  authenticate :user do
    scope :admin, module: :admin, as:'admin' do
      get '/', to: 'home#index',  as:"root"
      resources :candidates
      resources :parties
      resources :alliances
      resources :boxes
      resources :elections do
        get 'add_votes'
        post 'save_votes'
        get 'delete_votes'
      end
      resources :election_types
    end
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
