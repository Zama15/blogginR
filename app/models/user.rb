# frozen_string_literal: true

# Path: app/controllers/users_controller.rb
# This is the model for the users
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  # This is a macro that tells Rails that a user can have many posts.
  has_many :posts
  # This is a macro that tells Rails that a user can have many users_preferences.
  has_many :preferences
  # This is a macro that tells Rails that create a default preferences for a user.
  after_create :set_defaults_preferences
  def set_defaults_preferences
    preferences.create(color: '#000000', theme: 'light')
  end
end
