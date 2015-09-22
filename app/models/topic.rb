class Topic < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true, length: { maximum: 25 }

  friendly_id :title, use: :slugged
end
