Rails.application.routes.draw do

  root to: 'pages#new'
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages
  get '/:id' => 'pages#show', as: :one_page



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
