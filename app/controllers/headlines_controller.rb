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
  
  def create
    @headline = Headline.new(headline_params)
    if @headline.save
      redirect_to headlines_path, notice: '保存しました。'
    else
      render :index
    end
  end
  
  # def import
  # # fileはtmpに自動で一時保存される
  #   Headline.import(params[:file])
  #   redirect_to headlines_path, notice: "アップロードしました。"
  # end
  
  private
  def picture_params
    params.require(:picture).permit(:image_url, :remark, :headline_id)
  end
  
  private
  def headline_params
    params.require(:headline).permit(:name, :num)
  end


end

