Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'messages#react_chat_room', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :messages, only: [:create] do
    collection do
      get :chat_room
      get :react_chat_room
      get :api_index
    end
  end

  mount ActionCable.server, at: '/cable'
end
