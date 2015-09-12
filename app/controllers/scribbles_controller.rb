class ScribblesController < ApplicationController
  before_action :authorize, except: [:index, :show]
  before_action :set_scribble, only: [:show, :edit, :update, :destroy]

  # GET /scribbles
  # GET /scribbles.json
  def index
    @scribbles = current_user ? Scribble.all : Scribble.published
  end

  # GET /scribbles/1
  # GET /scribbles/1.json
  def show
  end

  # GET /scribbles/new
  def new
    @scribble = Scribble.new
  end

  # GET /scribbles/1/edit
  def edit
  end

  # POST /scribbles
  # POST /scribbles.json
  def create
    @scribble = Scribble.new(scribble_params)

    respond_to do |format|
      if @scribble.save
        format.html { redirect_to @scribble, notice: 'Scribble was successfully created.' }
        format.json { render :show, status: :created, location: @scribble }
      else
        format.html { render :new }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scribbles/1
  # PATCH/PUT /scribbles/1.json
  def update
    respond_to do |format|
      if @scribble.update(scribble_params)
        format.html { redirect_to @scribble, notice: 'Scribble was successfully updated.' }
        format.json { render :show, status: :ok, location: @scribble }
      else
        format.html { render :edit }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scribbles/1
  # DELETE /scribbles/1.json
  def destroy
    @scribble.destroy
    respond_to do |format|
      format.html { redirect_to scribbles_url, notice: 'Scribble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_scribble
    @scribble = Scribble.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def scribble_params
    params.require(:scribble).permit(:title, :content, :on)
  end
end
