Rails.application.routes.draw do
  # 訪問履歴
  resources :visits, only: [:edit, :show, :create]
  get 'visits/new/:id', to: 'visits#new', as: 'visit_new'
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
