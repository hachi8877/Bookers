Rails.application.routes.draw do

  get '' => 'homes#top', as: 'root'
  get 'books' => 'bookers#index', as: 'books'
  post 'books' => 'bookers#create'
  get 'books/:id' => 'bookers#show', as: 'book'
  get 'books/:id/edit' => 'bookers#edit', as: 'edit_book'
  patch 'books/:id' => 'bookers#update', as: 'update_book'
  delete 'books/:id' => 'bookers#destroy', as: 'destroy_book'
end
