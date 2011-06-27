class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update, :destroy], User, :id => user.id      # manage account created for him
    can :manage, [User, Site, Token], :creator_id => user.id  # manage own creations
  end

end
