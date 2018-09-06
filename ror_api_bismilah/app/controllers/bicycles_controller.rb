class BicyclesController < ApplicationController
  before_action :set_bicycle, only: [:show, :update, :destroy]

  def index
    @bicycles = Bicycle.all

    render json: @bicycles
  end

  def show
    # set_bicycle
     @bicycle = Bicycle.find(params[:id])
    render json: @bicycle
  end

  def new
    @Bicycle = Bicycle.new
  end

  def edit
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)

    respond_to do |format|
      if @bicycle.save
        format.json {render :show, status: :created, location: @bicycle}
      else
        format.json {render json: @bicycle.errors, status: :unprocessable_entity}
    end
  end

  end

  def update
    respond_to do |format|
      if @bicycle.update(bicycle_params)
        format.json {render :show, status: :ok, location: @bicycle}
      else
        format.json {render json: @bicycle.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.json {head :no_content}
    end
  end



  private
    
      

     def set_bicycle
      @bicycle = Bicycle.find(params[:id])
      render json: @bicycles
    end

    def bicycle_params
      params.require(:bicycle).permit(:name, :series)
    end

   
    
  

end
