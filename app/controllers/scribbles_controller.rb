class ScribblesController < ApplicationController
  before_action :authorize!, except: [:index, :show]
  before_action :set_scribble, only: [:show, :edit, :update, :destroy]

  def index
    scribbles = current_user ? Scribble.all : Scribble.published
    @scribbles = scribbles.page params[:page]
  end

  def show
  end

  def new
    @scribble = Scribble.new
  end

  def edit
  end

  def create
    @scribble = Scribble.new(scribble_params)

    if @scribble.save
      redirect_to @scribble, notice: 'Scribble was successfully created.'
    else
      render :new
    end
  end

  def update
    if @scribble.update(scribble_params)
      redirect_to @scribble, notice: 'Scribble was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @scribble.destroy
    redirect_to scribbles_url, notice: 'Scribble was successfully destroyed.'
  end

  private

  def set_scribble
    @scribble = Scribble.includes(:comments).friendly.find(params[:id])
  end

  def scribble_params
    params.require(:scribble).permit(:title, :content, :on)
  end
end
