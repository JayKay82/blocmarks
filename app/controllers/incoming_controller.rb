class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    email = {
      user:  params[:sender],
      topic: params[:subject],
      url:   params['body-plain']
    }
    @bookmark = EmailToBookmark.parse(email)
    @bookmark.save
    head 200
  end
end
