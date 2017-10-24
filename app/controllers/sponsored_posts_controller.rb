class SponsoredPostsController < ApplicationController
  def index
    @sponsored_posts = SponsoredPost.all
  end
  
  def show 
    @sponsored_post = SponsoredPost.find(params[:SponsoredPost_id])
  end
  
  def new
    @sponsored_post = SponsoredPost.new
  end
  
  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.name = params[:SponsoredPost][:name]
    @sponsored_post.description = params[:SponsoredPost][:description]
    @sponsored_post.public = params[:SponsoredPost][:public]
 
    if @sponsored_post.save
     redirect_to @sponsored_post, notice: "SponsoredPost was saved successfully."
    else
     flash.now[:alert] = "Error creating SponsoredPost. Please try again."
     render :new
    end
  end
  
  def edit
     @sponsored_post = SponsoredPost.find(params[:SponsoredPost_id])
  end
  
  def update
     @sponsored_post = SponsoredPost.find(params[:SponsoredPost_id])
 
     @sponsored_post.name = params[:SponsoredPost][:name]
     @sponsored_post.description = params[:SponsoredPost][:description]
     @sponsored_post.public = params[:SponsoredPost][:public]
 
     if @sponsored_post.save
        flash[:notice] = "SponsoredPost was updated."
       redirect_to @sponsored_post
     else
       flash.now[:alert] = "Error saving SponsoredPost. Please try again."
       render :edit
     end
  end
 
  def destroy
     @sponsored_post = SponsoredPost.find(params[:SponsoredPost_id])
 
     if @sponsored_post.destroy
       flash[:notice] = "\"#{@sponsored_post.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the SponsoredPost."
       render :show
     end
  end
end
