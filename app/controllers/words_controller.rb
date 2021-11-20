class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    Word.create(word_params)
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
  end

  def edit
    @word = Word.find(params[:id])
  end

  private
  def word_params
    params.require(:word).permit(:jiantizi, :fantizi, :english, :pronunciation_c, :pronunciation_e, :category_id, :mean, :memo)
  end
end