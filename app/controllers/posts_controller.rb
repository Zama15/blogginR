# frozen_string_literal: true

# Path: app/controllers/posts_controller.rb
# This is the controller for the posts resource.
class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update]

  # GET /posts => posts#index
  def index
    @posts = Post.all
    @categories = Category.all
  end

  # GET /posts/:id
  def show; end

  # GET /posts/category/:id
  def category
    @category_title = Category.find(params[:id]).title
    @posts = Post.joins(:posts_category).where(posts_categories: { category_id: params[:id] })
    @categories = Category.all
  end

  # GET /posts/new
  def new
    unless user_signed_in?
      redirect_to new_user_session_path
      flash[:alert] = 'You need to sign in to create a post.'
    end
    @post = Post.new
  end

  # POST /posts
  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to post_path(@post.id)
    else
      flash[:alert] = 'There was an error creating the post.'
      render :new
    end
  end

  # GET /posts/:id/edit
  def edit; end

  # PATCH /posts/:id
  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      flash[:alert] = 'There was an error updating the post.'
      render :edit
    end
  end

  # # DELETE /posts/:id
  # def destroy
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.find(params[:id])
  #   @post.destroy

  #   # Redirect to the posts index.
  #   redirect_to posts_path
  # end

  private

  def post_params
    params.require(:post).permit(:title, :body, :thumbnail)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
