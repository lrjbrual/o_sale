module ApplicationHelper

  def commented_by(user)
    user.fullname # passed it call it from model in user
  end
  
end
