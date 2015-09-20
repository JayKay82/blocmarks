class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :url, uniqueness: true, presence: { message: 'URL can\'t be empty' }
end
