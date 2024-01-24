# frozen_string_literal: true

# Path: app/controllers/session_controller.rb
# This is the controller for the sessions resource.
class SessionsController < ApplicationController
  layout 'modal-wrapper'

  # GET /login/new
  def new
    @user = User.new
  end

  # POST /login
  def create
    @user = find_user_by(params[:user][:username])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      display_error('Invalid user or password')
    end
  end

  # DELETE /logout
  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def find_user_by(username)
    user = User.find_by(username: username)
    return user if user

    user = User.find_by(email: username)
    return user if user

    nil
  end

  def display_error(error)
    flash[:error] = error
    redirect_to login_path
  end
end
