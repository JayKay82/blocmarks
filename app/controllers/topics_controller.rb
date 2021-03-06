class TopicsController < ApplicationController
  before_action :load_topic, only: [:create]
  # load_and_authorize_resource

  def index
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
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
    @topic ||= Topic.friendly.find(params[:id])
  end

  def load_topic
    @topic = current_user.topics.build(topic_params)
  end

  helper_method :topics, :topic, :new_topic
end
