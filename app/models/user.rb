class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def self.create_confirmed_blocmark_user(email)
    random_password = SecureRandom.hex(8)
    user = User.new(email: email,
                    password: random_password,
                    password_confirmation: random_password)
    user.skip_confirmation!
    user.save!
    user.send_reset_password_instructions
    user
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
