class KptsController < ApplicationController
  def index
    @kpts = Kpt.all
  end

  def show
    @kpt = Kpt.find(params[:id])
  end

  def new
    @kpt = Kpt.new
  end
end
