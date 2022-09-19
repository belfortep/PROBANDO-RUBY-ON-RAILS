class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end

#este modelo se creo con ruby bin/rails generate model Comment commenter:string body:text article:references, el article:references, hace que tenga la relacion belongs_to