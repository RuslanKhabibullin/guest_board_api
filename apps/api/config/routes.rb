namespace 'v1' do
  post '/sign_up', to: 'users#create', as: :v1_sign_up
  post '/sign_in', to: 'sessions#create', as: :v1_sign_in
  resources :messages, only: %i[index create update destroy]
end
