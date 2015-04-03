
class Admin::UsersController < ApplicationController


  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "#{@user.name} was successfully created!"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user), notice: "#{@user.firstname} was successfully updated!"
    else
      render :edit , notice: "Fail Blog! #{@user.firstname}'s' update failed!"
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.user_deleted(@user).deliver
    @user.destroy
    redirect_to admin_users_path, notice: "successfully deleted user."
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
