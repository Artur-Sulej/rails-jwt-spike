module ApplicationHelper
  def jwt_token(user=current_user)
    JWTWrapper.encode({ user_id: user.id })
  end
end
