class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc) #Permitimos que en la vista de un usuario se vean sus posts
  end
end
