# frozen_string_literal: true

# Path: app/controllers/application_controller.rb
# This is the controller for the application.
class ApplicationController < ActionController::Base
  before_action :categories_trend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :wrap_body?
  protect_from_forgery with: :exception
  helper_method :wrap_body?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[username avatar])
  end

  private

  def categories_trend
    @categories_trend = PostsCategory.select('category_id, COUNT(post_id) AS post_count')
                                     .group(:category_id)
                                     .order('post_count DESC')
                                     .limit(4)
  end

  def wrap_body?
    special_controller? && special_action?
  end

  def special_controller?
    controller_name == 'sessions' || controller_name == 'registrations' ||
      controller_name == 'passwords' || controller_name == 'confirmations'
  end

  def special_action?
    action_name == 'new' || action_name == 'edit' || action_name == 'update'
  end
end
