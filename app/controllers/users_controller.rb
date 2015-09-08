class UsersController < ApplicationController
  def update
    if current_user.update_attributes(user_params)
      redirect_to root_path, notice: 'User info successfully updated.'
    else
      redirect_to edit_user_registration_path, error: 'Unable to update user info. Please try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
