module Readers
	class PostsController < ReadersController
		def show
			@post = Post.published.friendly.find(params[:id])
			impressionist(@post)
		end
		def search
			if params[:search].blank?  
    		redirect_to root_path 
  		else  
    		@parameter = params[:search].downcase
    		@posts = Post.published.where("lower(title) LIKE :search", search: "%#{@parameter}%")
  		end
		end
	end
end