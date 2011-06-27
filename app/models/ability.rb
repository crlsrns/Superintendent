class Ability
  include CanCan::Ability

  def initialize(user)
    if user_signed_in?
      can [:read, :update, :destroy], User, :id => user.id
      can :manage, [User, Site, Token], :creator_id => user.id
    end
  end

end
