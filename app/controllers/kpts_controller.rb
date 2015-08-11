class KptsController < ApplicationController
  before_action :set_kpt, only: [:show, :edit, :update, :destroy]

  def index
    @kpts = Kpt.paginate(page: params[:page])
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
  end

  def edit
  end

  def create
    @kpt = Kpt.new(kpt_params)
    if @kpt.save
      flash[:success] = "Successfully created."
      redirect_to user_path(@kpt.user_id)
    else
      render 'new'
    end
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
    Kpt.find(params[:id]).destroy
    flash[:success] = "Successfully destroyed."
    #redirect_to user_path(@kpt.user_id)
  end

  private

    def kpt_params
      params.require(:kpt).permit(:keep, :problem, :try)
    end

    def set_kpt
       @kpt = Kpt.find(params[:id])
    end
end
