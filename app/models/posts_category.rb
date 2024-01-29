# frozen_string_literal: true

# Path: app/models/post_category.rb
# This is the model for the post_categories
class PostsCategory < ApplicationRecord
  # This is a macro that tells Rails that a post_category belongs to a post.
  belongs_to :post, foreign_key: 'post_id'
  # This is a macro that tells Rails that a post_category belongs to a category.
  belongs_to :category, foreign_key: 'category_id'
end
