class HeadlinesController < ApplicationController
  
  def index
    
    @headlines = Headline.includes(:pictures).all
    
    # @headline = Headline.find(id: params[:id])
    # @association = Headline.reflect_on_all_associations(:has_many)
    # binding.pry
  end
  
  def new
    @headline = Headline.new
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

