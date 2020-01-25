Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#index'
  resources :sessions, only:[:create]
  resources :users
  resources :blog ,only:[:index]
  resources :articles,only:[:index,:create]
  get 'log_out'=>'sessions#destroy', as:'logout'
  get 'category_article'=>'blog#article',as:'category_id'
  get 'article'=>'blog#show',as:'article_id'
end
