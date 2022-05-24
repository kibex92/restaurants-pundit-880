class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # def new?
  #   true
  # end
  
  def create?
    true
  end
  
  def show?
    true
  end
  
  # def edit?
  #   # if user == record.user
  #   #   true
  #   # else
  #   #   false
  #   # end
  #   user == record.user
  # end
  
  def update?
    # if user == record.user
    #   true
    # else
    #   false
    # end
    user_is_owner_or_admin?
  end
  
  def destroy?
    user_is_owner_or_admin?
  end
  
  def user_is_owner_or_admin?
    # record -> the restaurant passed to 'authorize'
    # user -> user currently logged in
    user == record.user || user.admin
  end
  
end
