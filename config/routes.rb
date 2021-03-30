Rails.application.routes.draw do
  scope module: 'authors' do
    get 'stats' => 'stats#index'
  	resources :posts do
  		resources :elements
  	end
  end
  devise_for :authors, only: [:sessions, :passwords]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "readers/home#index"
  get '/blog/:id' => 'readers/posts#show', as: :blog_post
  get '/search' => 'readers/posts#search', as: :search_post
end
