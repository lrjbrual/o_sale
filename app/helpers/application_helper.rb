module ApplicationHelper

  def commented_by(user)
    user.fullname # passed it call it from model in user
  end

  def persisted_comments(comments)
    comments.reject { |cmt| cmt.new_record? }
  end
  
end
