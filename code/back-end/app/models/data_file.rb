class DataFile < ActiveRecord::Base
   	attr_accessor :upload
  	
  	def self.save(upload)
	    require 'securerandom'
	    file_name = upload.original_filename
   		file_type = file_name.split('.').last
   		file_name = SecureRandom.urlsafe_base64 + '.' + file_type

	    directory = 'public/products/thumbnails'
	    # create the file path
	    path = File.join(directory,file_name)
	    # write the file
	    File.open(path, "wb") { |f| f.write(upload.read)}

	    return file_name;
	  end
end