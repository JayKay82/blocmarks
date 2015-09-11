class User < ActiveRecord::Base
  has_many :topics
  has_many :bookmarks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def self.create_confirmed_blocmark_user(email)
    user = User.new(email: email,
                    password: 'password',
                    password_confirmation: 'password')
    user.skip_confirmation!
    user.save!
    user
  end
end
