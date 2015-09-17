class BookmarksController < ApplicationController
  def new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic = topic
    @bookmark.user = current_user

    if @bookmark.save
      redirect_to @bookmark.topic, notice: 'Successfully created a new bookmark.'
    else
      render :new, error: 'Unable to create a new bookmark. Please try again.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def topic
    @topic ||= Topic.find(params[:topic_id])
  end

  def new_bookmark
    @bookmark ||= Bookmark.new
  end

  helper_method :new_bookmark, :topic
end
