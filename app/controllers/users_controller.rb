class UsersController < ApplicationController
  def show
  end

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

  def user_bookmarks
    @user_bookmarks ||= current_user.bookmarks.includes(:topic)
      .order(topic_id: :desc).all.group_by(&:topic)
  end

  def user_liked_bookmarks
    @user_liked_bookmarks ||= Bookmark.joins(likes: :user)
      .where(likes: { user_id: current_user.id })
      .order(topic_id: :desc).group_by(&:topic)
  end

  helper_method :user_bookmarks, :user_liked_bookmarks
end
