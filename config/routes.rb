Rails.application.routes.draw do
  
  # テリ登録
  resources :areas, only: [:new, :create, :update]
  
  # devise_for :users
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}
  # トップページ  
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
