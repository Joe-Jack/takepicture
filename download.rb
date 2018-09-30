require 'base64'

	data = params['picture']['image_url']
  #remove all extras except data
  image_data = Base64.decode64(data['data:image/jpeg;base64,'.length .. -1])

  File.open("#{Rails.root}/public/uploads/somefile.jpeg", 'wb') do |f|
    f.write image_data
  end