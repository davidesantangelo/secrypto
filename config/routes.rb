Rails.application.routes.draw do
  
  root 'static#index'
  
  constraints subdomain: 'api' do
    scope module: 'api' do
      post 'encrypt' => 'encrypt#encrypt'
      post 'decrypt' => 'decrypt#decrypt'
    end
  end

  namespace :api do
    post 'encrypt' => 'encrypt#encrypt'
    post 'decrypt' => 'decrypt#decrypt'
  end

  get 'decrypt/:key' => 'decrypt#decrypt'
end
