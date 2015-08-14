class KptsController < ApplicationController
  before_action :set_user, only: [:index, :new, :edit, :create]
  before_action :set_kpt, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to @user
  end

  def show; end

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

  def edit; end

  def update
    if @kpt.update(kpt_params)
      redirect_to [@kpt.user, @kpt], success: "Successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @kpt.destroy
    redirect_to [@kpt.user, :kpts], success: "Successfully destroyed."
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
