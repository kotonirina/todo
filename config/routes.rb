Rails.application.routes.draw do
	root to: "todo_lists#index"

	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :todo_lists do
  	resources :categories
  end
end
