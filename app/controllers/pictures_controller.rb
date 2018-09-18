class PicturesController < ApplicationController
  
  def index
    @picture = Picture.new
    @headline = params[:headline_id]
    
    # binding.pry
  end 

  def create
    
    @picture = Picture.new(picture_params)
    @picture.image_url = params['picture']['image_url']
    # binding.pry
    @picture.headline_id = params['picture']['headline_id']
    if @picture.save
      redirect_to headlines_path, notice: '保存しました。'
    else
      render :index
    end
  end
  
  def take2
    @picture = Picture.new
  end
  
  def create2
    @picture = Picture.new(picture_params)
    @picture.image_url = params['picture']['image_url']
    if @picture.save
      redirect_to headlines_path, notice: '保存しました。'
    else
      render :index
    end
  end
  
   private
  def picture_params
    params.require(:picture).permit(:image_url, :remark, :headline_id)
  end
  
  private
  def headline_params
    params.require(:headline).permit(:name, :pictures_count)
  end
  
end
