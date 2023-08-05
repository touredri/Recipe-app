# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    user ||= User.new # guest user (not logged in)

    # can read all public recipes
    can :read, Recipe, public: true
    can :create , Food if user.persisted?

    # if user is logged in, can manage their own recipes
    return unless user.id

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
