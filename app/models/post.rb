class Post < ActiveRecord::Base

	def self.search(search)
	   if search
	    @posts = Post.where(author: search)
	  else
	    @posts = Post.all
	  end
	end

end
