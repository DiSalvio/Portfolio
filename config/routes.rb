Rails.application.routes.draw do
 
  resources :posts do
    get 'drafts', on: :collection
  end
 
  get 'post/cancel' => 'posts#cancel'  
  get 'post/cancel_edit' => 'posts#cancel_edit'
  get 'tags/:tag' => 'posts#index', as: "tag"

  resources :projects, param: :name do
    get 'drafts', on: :collection
  end

  get 'project/cancel' => 'projects#cancel'
  get 'project/cancel_edit' => 'projects#cancel_edit'

  devise_for :admins, :skip => :registrations
  get '/home' => 'pages#home'
  root 'pages#home'

end
