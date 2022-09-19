class ArticlesController < ApplicationController#NO NECESITO UN REQUIRE PARA EL CODIGO DE MI APLICACION, POR ESO HEREDO SIN NECESITAR CARGAR EL ARCHIVO
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] #necesito auth para todos metodos, excepto index y show
  
  
  def index #al definir la funcion vacia, devuelve simplemente un HTML
     #que esta en la carpeta con el mismo nombre del controlador y archivo con nombre de esta funcion


    @articles = Article.all #variables del controlador pueden accederse en la vista 

  end

  def show
    @article = Article.find(params[:id])#como la ruta tenia un /:id, puedo acceder al params[id]
  end #esta funcion mostraria app/views/articles/show.html.erb  

  def new
    @article = Article.new #crea un nuevo objeto de la entidad, esta mapeado al html de articles/new
  end

  #mapeado a post /articles
  def create  #crea un nuevo objeto e intenta guardarlo en la DB, si funciona la guarda y te lleva a articles/id, si no, te manda error 422
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other #redirect_to, el primer parametro es el path al que me devuelve, el segundo el HTTP status
  end

    private
      def article_params  #forma para validar los datos que se envian
        params.require(:article).permit(:title, :body, :status)
      end

end
#para inicializar el servidor, estando en la carpeta ruby bin/rails server
#para agregar nuevo controlador ruby bin/rails generate controller Articles index --skip-routes
