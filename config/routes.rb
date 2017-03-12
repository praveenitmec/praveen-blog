Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  get '/myposts', to: 'posts#my_posts'
  post '/create_comment', to: 'comments#create'
  delete '/delete_comment', to: 'comments#destroy'
  get '/posts-by-tags/:tag', to: 'posts#tag_posts'
end
