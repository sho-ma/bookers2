Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
    root to: 'homes#top'
    resources :books, only: [:new, :create, :index, :show, :destroy]
end