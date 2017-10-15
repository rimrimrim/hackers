Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :messages do
    resources :comments
  end

  post 'messages/:id' => 'messages#index'

  root "messages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
