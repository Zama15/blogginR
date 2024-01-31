# frozen_string_literal: true

# Path: app/models/comment.rb
# This is the model for the comments
class Comment < ApplicationRecord
  # This is a macro that tells Rails that a comment belongs to a user.
  belongs_to :user, foreign_key: 'author_id'
  # This is a macro that tells Rails that a comment belongs to a post.
  belongs_to :post, foreign_key: 'post_id'
end
