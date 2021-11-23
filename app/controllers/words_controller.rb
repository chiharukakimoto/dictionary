class WordsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @words = Word.all.order(:pronunciation_c)
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.create(word_params)
    if @word.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update(word_params)
  end

  def show
    @word = Word.find(params[:id])
  end

  private
  def word_params
    params.require(:word).permit(:jiantizi, :fantizi, :english, :pronunciation_c, :pronunciation_e, :category_id, :mean, :memo).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
