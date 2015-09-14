class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, length: { maximum: 25 }
end
