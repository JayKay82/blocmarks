class Ability
  include CanCan::Ability

  def initialize(user)

    # Raise an exception if a user is not present
    # This will redirect unauthenticated use to root
    raise(CanCan::AccessDenied) unless user

    can :read, :all

    # Topics
    can :create, Topic
    can :destroy, Topic, user_id: user.id

    # Bookmarks
    can :create, Bookmark
    can [:update, :destroy], Bookmark, user_id: user.id
  end
end
