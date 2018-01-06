class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    p params
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    
    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      
      flash.now[:alert] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
  
  def edit
    @advertisement = Advertisement.find(params[:id])
  end
  
  def update
    @advertisement = Advertisement.find(params[:id])
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price= params[:advertisement][:price]
    
    if @advertisement.save
      flash[:notice] = "Ad was updated."
      render :show
    else
      flash.now[:alert] = "There was an error updating this ad."
      render :edit
    end
  end
  
  def destroy
    @advertisement = Advertisement.find(params[:id])
    
    if @advertisement.destroy
      flash[:notice] = "\"#{@advertisement.title}\" was deleted successfully."
      redirect_to advertisements_path
    else
      flash.now[:alert] = "There was an error deleting this ad."
      render :show
    end
  end
end
