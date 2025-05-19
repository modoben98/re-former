class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

     if @user.save
      redirect_to user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private

  def user_params
    params.expect(user: [:username, :email, :password])
  end
end
