class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
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

  def edit
  end

  def update
    if bookmark.update_attributes(bookmark_params)
      redirect_to bookmark.topic, notice: 'Successfully updated your bookmark.'
    else
      render :edit, error: 'Unable to update your bookmark. Please try again.'
    end
  end

  def destroy
    if bookmark.destroy
      redirect_to bookmark.topic, notice: 'Successfully deleted your bookmark.'
    else
      redirect_to bookmark.topic, error: 'Unable to delete your bookmark. Please try again.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def bookmark
    @bookmark ||= Bookmark.find(params[:id])
  end

  def topic
    @topic ||= Topic.find(params[:topic_id])
  end

  # def new_bookmark
  #   @bookmark ||= Bookmark.new
  # end

  helper_method :bookmark, :topic
end
