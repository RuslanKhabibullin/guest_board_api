namespace 'v1' do
  post '/sign_up', to: 'users#create', as: :v1_sign_up
  post '/sign_in', to: 'sessions#create', as: :v1_sign_in
  post '/sign_in/oauth', to: 'sessions#oauth', as: :v1_sign_in_oauth
  get '/users/me', to: 'users#show', as: :v1_show_user
  resources :messages, only: %i[index create update destroy]
end
