class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :edit, :destroy]
  before_action :set_board
  def index
    @lists = List.all
  end

  def show
    
  end

  def new
    @list = @board.lists.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_lists_path
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:todo, :board_id)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end
  
end
