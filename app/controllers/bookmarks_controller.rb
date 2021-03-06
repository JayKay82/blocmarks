class BookmarksController < ApplicationController
  before_action :load_bookmark, only: [:create]
  load_and_authorize_resource

  def new
    @bookmark = Bookmark.new
  end

  def create
    if @bookmark.save
      redirect_to root_path, notice: 'Successfully created a new bookmark.'
    else
      render :new, error: 'Unable to create a new bookmark. Please try again.'
    end
  end

  def edit
  end

  def update
    if bookmark.update_attributes(bookmark_params)
      redirect_to root_path, notice: 'Successfully updated your bookmark.'
    else
      render :edit, error: 'Unable to update your bookmark. Please try again.'
    end
  end

  def destroy
    if bookmark.destroy
      redirect_to :back, notice: 'Successfully deleted your bookmark.'
    else
      redirect_to :back, error: 'Unable to delete your bookmark. Please try again.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_id)
  end

  def bookmark
    @bookmark ||= Bookmark.find(params[:id])
  end

  def load_bookmark
    @bookmark = current_user.bookmarks.build(bookmark_params)
  end

  # def topics
  #   @topics ||= Topic.all
  # end

  # def topic
  #   @topic ||= Topic.find(params[:topic_id])
  # end

  helper_method :bookmark, :topic
end
