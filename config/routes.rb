Rails.application.routes.draw do
 
  resources :posts do
    get 'drafts', on: :collection
  end
  
  get 'tags/:tag', to: 'posts#index', as: "tag"

  resources :projects, param: :name do
    get 'drafts', on: :collection
  end


  devise_for :admins, :skip => :registrations
  get '/home' => 'pages#home'
  root 'pages#home'

end
