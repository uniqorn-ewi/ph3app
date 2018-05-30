Rails.application.routes.draw do
  root to: 'pictures#top'

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :favorite_pictures, only: [:index]
  end

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
