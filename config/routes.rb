Rails.application.routes.draw do

  root "articles#index" #la ruta inicial, tambien esta unida a articles#index

  #get "/articles", to: "articles#index" 
  
  #la ruta get a /articles, esta unida a la accion "index" de ArticlesController
  #perfecto, llamo a localhost:3000/articles, y de aca va para controllers/articles_controller que se creo con
  #ruby bin/rails generate controller Articles index --skip-routes para crear ese archivo
  #get "/articles/:id", to: "articles#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #otra forma mas conveniente cuando tenemos una entidad que vamos a hacer un CRUD completo, es usar resource
  #usando ruby bin/rails routes podemos ver todas las rutas
  resources :articles do
    resources :comments #comentarios es un recurso dentro de articulos
  end

end
