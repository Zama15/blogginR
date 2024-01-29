# frozen_string_literal: true

# Path: app/controllers/posts_controller.rb
# This is the controller for the posts resource.
class PostsController < ApplicationController
  # GET /posts => posts#index
  def index
    @posts = Post.all
    @categories = Category.all
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/category/:id
  def category
    @category_title = Category.find(params[:id]).title
    @posts = Post.joins(:posts_category).where(posts_categories: { category_id: params[:id] })
    @categories = Category.all
  end

  # # GET /posts/new
  # def new
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.new
  # end

  # # POST /posts
  # def create
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.new(post_params)

  #   if @post.save
  #     # If the post is saved successfully, redirect to the posts index.
  #     redirect_to posts_path
  #   else
  #     # Otherwise render the new template again with the @post instance variable.
  #     render :new
  #   end
  # end

  # # GET /posts/:id/edit
  # def edit
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.find(params[:id])
  # end

  # # PATCH /posts/:id
  # def update
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.find(params[:id])

  #   if @post.update(post_params)
  #     # If the post is updated successfully, redirect to the posts index.
  #     redirect_to posts_path
  #   else
  #     # Otherwise render the edit template again with the @post instance variable.
  #     render :edit
  #   end
  # end

  # # DELETE /posts/:id
  # def destroy
  #   # This is an instance variable, which means it will be available in the view.
  #   @post = Post.find(params[:id])
  #   @post.destroy

  #   # Redirect to the posts index.
  #   redirect_to posts_path
  # end
end
