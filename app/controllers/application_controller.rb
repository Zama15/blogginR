# frozen_string_literal: true

# Path: app/controllers/application_controller.rb
# This is the controller for the application.
class ApplicationController < ActionController::Base
  before_action :categories_trend, :set_current_user
  helper_method :wrap_body?

  private

  def categories_trend
    @categories_trend = PostsCategory.select('category_id, COUNT(post_id) AS post_count')
                                     .group(:category_id)
                                     .order('post_count DESC')
                                     .limit(4)
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def wrap_body?
    special_controller? && special_action?
  end

  def special_controller?
    controller_name == 'sessions' || controller_name == 'users'
  end

  def special_action?
    action_name == 'new'
  end
end
