class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    #will_paginateに渡すため
    @kpts = @user.kpts.paginate(page: params[:page])
  end
end
