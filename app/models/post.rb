# frozen_string_literal: true

# Path: app/controllers/posts_controller.rb
# This is the model for the posts
class Post < ApplicationRecord
  # This is a macro that tells Rails that a post belongs to a user.
  belongs_to :user, foreign_key: 'author_id'
  # This is a macro that tells Rails that a post can have many comments.
  # has_many :comments
  # This is a macro that tells Rails that a post can have many post_categories.
  has_many :posts_category
end
