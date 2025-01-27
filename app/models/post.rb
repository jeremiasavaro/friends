#Modelo principal para los posts, con validaciones y asociaciones
class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:1, maximum:200}
  validates :description, presence: true, length: {minimum:1, maximum:250}
  validates :keywords, presence: true, length: {minimum:1, maximum:100}

  has_many_attached :images
  belongs_to :user
  has_many :comments

  before_create :randomize_id
  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end
end
