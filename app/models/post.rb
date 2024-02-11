# frozen_string_literal: true

# Path: app/controllers/posts_controller.rb
# This is the model for the posts
class Post < ApplicationRecord
  # This is a macro that tells Rails that a post belongs to a user.
  belongs_to :user
  # This is a macro that tells Rails that a post can have many post_categories.
  has_many :posts_category
  # This is a macro that tells Rails that a post have attached files.
  has_one_attached :thumbnail

  validates :thumbnail, attached: true, content_type: %i[png jpg jpeg gif], size: { less_than: 1.megabyte, message: 'is not given between size' }
end
