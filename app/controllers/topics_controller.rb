class TopicsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to root_path, notice: 'Successfully created new topic.'
    else
      render :new, error: 'Unable to create a new topic. Please try again.'
    end
  end

  def destroy
    if topic.destroy
      redirect_to root_path, notice: 'Successfully deleted topic.'
    else
      redirect_to root_path, error: 'Unable to destroy topic. Please try again.'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def topics
    @topics ||= Topic.all
  end

  def topic
    @topic ||= Topic.find(params[:id])
  end

  def new_topic
    @topic ||= Topic.new
  end

  helper_method :topics, :topic, :new_topic
end
