class UsersController < ApplicationController
  before_action :login_confirmation, except: [:new, :create] #TODO 漏れが出てくるためapplicationコントローラに記述する

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    #will_paginateに渡すため
    @kpts = @user.kpts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "successfully created"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def login_confirmation
      redirect_to new_user_path unless signed_in?
    end
end
