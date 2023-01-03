class Publics::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

   def update
    @user = current_user
    if @user.update(user_params)
      redirect_to admins_user_path(@user.id)
    else
      render :show
    end
   end

  def confirm
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update
    redirect_to publics_homes_top_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephon_number, :email)
  end
end
