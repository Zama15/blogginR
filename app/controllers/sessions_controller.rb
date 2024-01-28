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
    @user = User.find_by(username: username)

    if valid_params?(password)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid user or password.'
      redirect_to login_path
    end
  end

  # DELETE /logout
  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def legacy_authenticate(pass_plain)
    php_file = 'app/controllers/helpers/auth_password.php'
    output = `php #{php_file} '#{pass_plain}' '#{@user.password_php}'`

    output == 'true'
  end

  def valid_params?(pass_plain)
    if @user&.password_php
      legacy_authenticate(pass_plain)
    elsif @user&.password_digest
      @user.authenticate(pass_plain)
    else
      false
    end
  end

  def username
    params[:user][:username]
  end

  def password
    params[:user][:password]
  end
end
