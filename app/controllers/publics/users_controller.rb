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
      redirect_to my_page_publics_users_path(@user.id)
    else
      render :show
    end
   end

  def confirm
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to publics_homes_top_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

  def withdrawal_params
    params.require(:user).permit(:is_deleted)
  end
end
