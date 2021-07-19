Rails.application.routes.draw do
  # 検索
  get 'search', to: 'areas#search', as: 'search'
  # 訪問履歴
  resources :visits, only: [:index, :edit, :show, :create, :edit, :update]
  get 'visits/new/:id', to: 'visits#new', as: 'visit_new'
 
   #   移動リンク　status: 0
  get  'areas/(:id)/update', to: 'areas#update', as: 'area_update'
  # テリ登録
  resources :areas, only: [:new, :create]
 
  
  
  # devise_for :users
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
}
# ユーザー一覧ボタン
  get 'users/(:id)/show',   to: 'home#show',  as: 'user_show'

  get 'users/(:id)/area',   to: 'areas#show',  as: 'area_show'
  # トップページ  
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
