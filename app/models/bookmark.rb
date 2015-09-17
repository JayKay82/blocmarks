class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :url, uniqueness: true
end
