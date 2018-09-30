class PicturesController < ApplicationController
  
  def index
    @picture = Picture.new
    @headline = params[:headline_id]
    
    # binding.pry
  end 

  def create
    
    @picture = Picture.new(picture_params)
    @picture.image_url = params['picture']['image_url']
    @picture.id = params['picture']['id']
    @picture.headline_id = params['picture']['headline_id']
    @picture.blobpic = params['picture']['blobpic']
    
    if @picture.save
      redirect_to headlines_path, notice: '保存しました。'
    else
      render :index
    end
    
    image_data = Base64.decode64(@picture.image_url['data:image/jpeg;base64,'.length .. -1])
    
    File.open("#{Rails.root}/public/uploads/#{@picture.headline_id}_#{@picture.id}.jpeg", 'wb') do |f|
      f.write(image_data)
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
    params.require(:picture).permit(:image_url, :remark, :headline_id, :blobpic)
  end
  
  private
  def headline_params
    params.require(:headline).permit(:name, :pictures_count)
  end
  
end
