class WordsController < ApplicationController
  before_action :set_word, only: [:destroy, :edit, :update, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @words = Word.all.order(:pronunciation_c)
    @words = Word.includes(:user)
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
    @word.destroy
  end

  def edit

  end

  def update
    @word.update(word_params)
  end

  def show
  end

  def search
    @words = Word.search(params[:keyword])
    if @words != nil
      render :index
    end
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

  def set_word
    @word = Word.find(params[:id])
  end
end
