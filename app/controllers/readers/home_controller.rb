module Readers
	class HomeController < ReadersController
	  def index
	  	@posts = Post.published.most_recently_published
	  	@impressions = Post.published.most_impressionist
	  end
	end
end
