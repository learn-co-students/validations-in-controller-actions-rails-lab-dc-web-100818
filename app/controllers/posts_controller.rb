class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post = Post.find(params[:id])
    input = Post.new(post_params)
    if input.valid?
      @post.save(post_params)
      redirect_to post_path(@post)
    else
      @post = input
      render :edit
    end 
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
