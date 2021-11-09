class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all # start by defining rules for all users, also not logged ones

    return unless user.is? :default

    can :manage, Post, author_id: user.id # if the user is logged in can manage it's own posts
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    can :create, Comment # logged in users can also create comments
    can :create, Post
    can :create, Like

    return unless user.is? :admin

    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
