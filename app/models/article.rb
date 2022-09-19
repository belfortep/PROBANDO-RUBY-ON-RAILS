class Article < ApplicationRecord   
        include Visible    
        has_many :comments, dependent: :destroy      #la otra parte de la asociacion, un Articulo tiene muchos comentarios, y cuando elimina un articulo, destruye todos sus comentarios
        
        validates :title, presence: true        #agregando validaciones que deben cumplir los datos antes de poder guardarse
        validates :body, presence: true, length: { minimum: 10 }       
        
        
end

#PARA CREAR UN MODELO, TENEMOS EL COMANDO ruby bin/rails generate model Nombre_Modelo campo1:tipo campo2:tipo campo3:tipo ... campoN:tipo