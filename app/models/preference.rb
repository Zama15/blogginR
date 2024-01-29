# frozen_string_literal: true

# Path: app/models/users_preference.rb
# This is the model for the users_preferences
class Preference < ApplicationRecord
  # This is a macro that tells Rails that a users_preference belongs to a user.
  belongs_to :user, foreign_key: 'user_id'
end
