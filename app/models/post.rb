#Modelo principal para los posts, con validaciones y asociaciones
class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:1, maximum:200}  #Validamos que el título sea obligatorio y tenga un mínimo y máximo de caracteres
  validates :description, presence: true, length: {minimum:1, maximum:250} #Validamos que la descripción sea obligatoria y tenga un mínimo y máximo de caracteres
  validates :keywords, presence: true, length: {minimum:1, maximum:100} #Validamos que las palabras clave sean obligatorias y tengan un mínimo y máximo de caracteres

  has_many_attached :images #Añadimos la relación con las imágenes
  belongs_to :user  #Añadimos la relación con el usuario
  has_many :comments #Añadimos la relación con los comentarios
  has_many :likes #Añadimos la relacion con los likes

  before_create :randomize_id
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end
end
