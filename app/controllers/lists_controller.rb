class ListsController < ApplicationController
  before_action :set_movie, only: [:show]


  #GET /lists
  def index
    @lists = List.all
  end

  #GET /lists/1
  def show; end

  #GET /lists/new
  def new
    @list = List.new
  end

  #POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list), notice: 'List saved successfully!'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_movie
    @list = List.find(params[:id])
  end
end
