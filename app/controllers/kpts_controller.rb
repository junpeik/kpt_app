class KptsController < ApplicationController
  before_action :set_user, only: [:index, :new, :edit, :create]
  before_action :set_kpt, only: [:show, :edit, :update, :destroy]

  def index
    @kpts = @user.kpts
  end

  def show
  end

  def new
    @kpt = @user.kpts.build
  end

 def create
    @kpt = @user.kpts.build(kpt_params)
    if @kpt.save
      redirect_to [@kpt.user, @kpt], success: "Successfully created."
    else
      render 'new'
    end
 end

  def edit
  end

  def update
    if @kpt.update_attributes(kpt_params)
      flash[:success] = "Successfully updated."
      redirect_to user_path(@kpt.user_id)
    else
      render 'edit'
    end
  end

  def destroy
    @kpt.destroy
    flash[:success] = "Successfully destroyed."
    redirect_to user_path(params[:user_id])
  end

  private

    def kpt_params
      params.require(:kpt).permit(:keep, :problem, :try)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_kpt
       @kpt = Kpt.find(params[:id])
    end
end
