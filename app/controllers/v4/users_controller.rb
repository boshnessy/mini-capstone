class V4::UsersController < ApplicationController
  def create
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
