class ApplicationController < ActionController::API
  include Knock::Authenticable

  def authenticate_admin
    if current_user && current_user.admin
      # proceed
    else
      render json: {message: "You are not authorized to do this"}, status: :unauthorized
    end
  end
end
