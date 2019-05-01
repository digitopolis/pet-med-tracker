class Api::V1::UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
	  @users = User.all
		render json: @users
	end

	def show
	  render json: @user
	end

	def new
	  @user = User.new
	end

	def create
	  @user = User.create(user_params)
		if @user.valid?
			render json: @user
		else
			render json: { error: 'failed to create user' }, status: :not_acceptable
		end
	end

	private

	def user_params
	  params.permit(:username, :password, :password_confirmation)
	end

	def find_user
	  @user = User.find(params[:id])
	end
end
