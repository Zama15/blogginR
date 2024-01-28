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
      success_login
    elsif php_authenticate?(params[:user][:password])
      success_login
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

  def php_authenticate?(password)
    @user&.password_php && php_auth(password)
  end

  def php_auth(password)
    php_file = 'app/controllers/helpers/auth_password.php'
    output = `php #{php_file} '#{password}' '#{@user&.password_php}'`

    output == 'true'
  end

  def display_error(error)
    flash[:error] = error
    redirect_to login_path
  end

  def success_login
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
