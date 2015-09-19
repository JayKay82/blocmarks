class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :url, uniqueness: true, presence: { message: 'URL can\'t be empty' }
end
