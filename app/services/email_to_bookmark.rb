# This class takes in an email parses it and returns an unsaved bookmark object
class EmailToBookmark
  def self.parse(email)
    # Check if user is nil, if so, create and save a new user
    user = User.find_by(email: email[:user]) || User.create_confirmed_blocmark_user(email[:user])

    # Check if the topic is nil, if so, create and save a new topic
    topic = user.topics.find_or_create_by(title: email[:topic])

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    Bookmark.new(url: email[:url], topic: topic, user: user)
  end
end
