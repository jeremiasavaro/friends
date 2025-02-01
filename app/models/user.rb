class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts #Añadimos la relación con los posts
  has_many :comments #Añadimos la relación con los comentarios
  has_one_attached :avatar #Añadimos la relación con el avatar
  has_many :likes #Añadimos la relacion con los likes

  #Nos aseguramos de crear un id único, random y seguro para cada usuario
  before_create :randomize_id
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end

end
