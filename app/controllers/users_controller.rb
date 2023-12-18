class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy, :update]

  def index
   @users = User.page(params[:page]).order(created_at: :desc)
   render json: { total: User.all.size, users: @users } , status: :ok
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.present?
      render json: @user, status: :ok
    else
      render json: "User not found", status: :not_found
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.welcome_email(user).deliver_now
      render json: {message: 'User is Created', data: user }, status: :ok
    else
      render json: {message: 'User not created' }
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: { message: 'User data updated' }
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.destroy
      render json: { message: "User deleted" }
    end
  end

  def users_list_member
    render json: { message: "member routes" }
  end

  def friends_list_collection
    users = User.all

    all_users = users.map do |user|
      {
        id: user.id,
        testname: user.username,
        fullname: user.fullname
      }
    end
    render json: { users: all_users, message: "collection routes" }
  end

  private

  def user_params
    params.permit(:username, :email)
  end
end