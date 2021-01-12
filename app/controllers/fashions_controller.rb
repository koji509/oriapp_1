class FashionsController < ApplicationController
  before_action :set_fashion, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @fashions = Fashion.includes(:user)
  end

  def new
    @fashion = Fashion.new
  end

  def create
    @fashion = Fashion.new(fashion_params)
    if @fashion.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @fashion.comments
  end

  def edit
  end

  def update
    if @fashion.update(fashion_params)
      redirect_to fashion_path(@fashion)
    else
      render :edit
    end
  end

  def destroy
    if @fashion.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def fashion_params
    params.require(:fashion).permit(:artist, :brand, :item, :image).merge(user_id: current_user.id)
  end

  def set_fashion
    @fashion = Fashion.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @fashion.user
  end
end