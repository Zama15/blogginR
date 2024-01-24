# frozen_string_literal: true

# Path: app/controllers/users_controller.rb
# This is the controller for the users resource.
class UsersController < ApplicationController
  # # GET /users/:id
  # def show
  #   @user = User.find(params[:id])
  # end

  # GET /users/new
  def new
    @user = User.new
    render layout: 'modal-wrapper'
  end

  # POST /users
  def create
    @user = User.new(user_params)

    error = valid_params(@user)

    if !error && @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      display_error(error || 'Something went wrong')
    end
  end

  # # GET /users/:id/edit
  # def edit
  #   # This is an instance variable, which means it will be available in the view.
  #   @user = User.find(params[:id])
  # end

  # # PATCH /users/:id
  # def update
  #   # This is an instance variable, which means it will be available in the view.
  #   @user = User.find(params[:id])

  #   if @user.update(user_params)
  #     # If the user is updated successfully, redirect to the users index.
  #     redirect_to users_path
  #   else
  #     # Otherwise render the edit template again with the @user instance variable.
  #     render :edit
  #   end
  # end

  # # DELETE /users/:id
  # def destroy
  #   # This is an instance variable, which means it will be available in the view.
  #   @user = User.find(params[:id])
  #   @user.destroy

  #   # Redirect to the users index.
  #   redirect_to users_path
  # end

  private

  def user_params
    params.require(:user)
          .permit(
            :username, :email, :password, # This are required fields
            :password_confirmation, # This is a virtual attribute
            :firstname, :lastname, :avatar # This are optional fields
          )
  end

  def user_exists?(user)
    User.find_by(username: user.username) || User.find_by(email: user.email)
  end

  def confirm_password?(user)
    user.password == user.password_confirmation
  end

  def password_valid?(user)
    user.password.length >= 8
  end

  def valid_params(user)
    if user_exists?(user) then 'Username or email already exists'
    elsif !confirm_password?(user) then 'Password does not match'
    elsif !password_valid?(user) then 'Password must be at least 8 characters long'
    end
  end

  def display_error(error)
    flash[:error] = error
    redirect_to logup_path
  end
end
