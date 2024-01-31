# frozen_string_literal: true

# Path: app/models/category.rb
# This is the model for the categories
class Category < ApplicationRecord
  # This is a macro that tells Rails that a category can have many posts.
  has_many :posts
  # This is a macro that tells Rails that a category can have many post_categories.
  has_many :post_categories
end
