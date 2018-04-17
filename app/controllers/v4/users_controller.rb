class V4::UsersController < ApplicationController
  def create
    p "*" * 50
    p current_user
    p "*" * 50
    user = User.new(
      {
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      })

    if user.save
      render json: {message: "You successfully signed up"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
