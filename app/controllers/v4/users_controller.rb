class V4::UsersController < ApplicationController
  def create
    user = User.new
      ({
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      })
    if user.save
      render json: {message: "You successfully created a user"}, status: :created
    else
      render json {errors: user.errors_full_message}, status: :bad_request
    end
end
end