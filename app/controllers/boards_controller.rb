class BoardsController < ApplicationController
  before_action :set_board, only:[:show, :edit, :update, :destroy]
  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params_board)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(params_board)
      redirect_to boards_path
    else 
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end
  
  def params_board
    params.require(:board).permit(:message, :id)
  end
end
