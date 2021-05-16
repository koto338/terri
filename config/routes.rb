Rails.application.routes.draw do
  
  # テリ登録
  get  'areas/new',     to: 'areas#new',     as: 'area_new'
  post 'areas/create',  to: 'areas#create',  as: 'area_create'
  #  status: 0
  get  'areas/(:id)/update', to: 'areas#update', as: 'area_update'
   

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
