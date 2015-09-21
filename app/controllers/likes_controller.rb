class LikesController < ApplicationController
  def create
    like = current_user.likes.build(bookmark: bookmark)

    if like.save
      redirect_to :back, notice: 'Successfully liked bookmark.'
    else
      redirect_to :back, error: 'Unable to like bookmark. Please try again.'
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])

    if like.destroy
      redirect_to :back, notice: 'Successfully disliked bookmark.'
    else
      redirect_to :back, error: 'Unable to dislike bookmark. Please try again.'
    end
  end

  private

  def bookmark
    @bookmark ||= Bookmark.find(params[:bookmark_id])
  end

  helper_method :bookmark
end
