Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      post 'encrypt' => 'encrypt#encrypt'
      post 'decrypt' => 'decrypt#decrypt'
    end
  end
end
