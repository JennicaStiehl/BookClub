Rails.application.routes.draw do
  # http://guides.rubyonrails.org/routing.html

  get '/books/new(.:format)', to: 'books#new', as: 'new_book'
  get '/books', to: 'books#index', as: 'books'
  get '/books/:id', to: 'books#show', as: 'book'
  post '/books', to: 'books#create'
  delete '/books/:id', to: 'books#destroy'

  get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
  post '/books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'
  delete '/books/:book_id/reviews/:id', to: 'reviews#destroy', as: 'book_review'

  get '/authors/:id', to: 'authors#show'
  delete '/authors/:id', to: 'authors#destroy', as: 'author'

  get '/', to: 'welcome#index', as: 'welcome'

  get '/user/:user', to: 'reviews#user_show', as: 'user'
end
