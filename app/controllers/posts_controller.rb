class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post, status: :created
    
  end

  private

  def render_not_found_response
    render json: { error: "Not found" }, status: :unprocessable_entity
  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
