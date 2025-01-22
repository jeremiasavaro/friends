#Modelo principal para los posts, con validaciones y asociaciones
class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:1, maximum:200}
  validates :description, presence: true, length: {minimum:1, maximum:250}
  validates :keywords, presence: true, length: {minimum:1, maximum:100}

  has_many_attached :images
end
