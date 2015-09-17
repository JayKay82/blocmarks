require 'uri'
# This class takes in an email parses it and returns an unsaved bookmark object
class EmailToBookmark
  def self.parse(email)
    return false if (email[:user] == nil) || (email[:user] == '')
    return false if (email[:url] == nil) || (email[:url] == '')
    email[:topic] = 'Miscellaneous' if (email[:topic] == nil) || (email[:topic] == '')
    # Check if user is nil, if so, create and save a new user
    user = User.find_by(email: email[:user]) || User.create_confirmed_blocmark_user(email[:user])

    # Check if the topic is nil, if so, create and save a new topic
    topic = user.topics.find_or_create_by(title: email[:topic])

    # Strip the first url from email
    url = email[:url].slice(URI.regexp)

    # Now that you're sure you have a valid user and topic, build and save a new bookmark
    Bookmark.new(url: url, topic: topic, user: user)
  end
end
