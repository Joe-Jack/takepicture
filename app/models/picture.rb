class Picture < ActiveRecord::Base
  belongs_to :headline, counter_cache: true

  
    # mount_uploader :image_url, ImageUrlUploader
  
  # attr_accessor :image_url
  # validates :image_url, {presence: true}
 
    
end
