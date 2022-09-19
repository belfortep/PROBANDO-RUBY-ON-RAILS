class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t| #el create_table me dice como se deben crear los articulos en este caso, y ademas le agrega un id como PK y auto-increment
      t.string :title
      t.text :body  #estas 2 columnas las genero el comando (en archivo app/models lo coloque)

      t.timestamps
    end
  end
end
#para ejecutar las migraciones usamos ruby bin/rails db:migrate