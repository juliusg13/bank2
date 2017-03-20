class V1::UsersController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:index, :show], raise: false
	before_action :set_user, only: [:destroy, :index]
	def index
		find_user
		render json: {'name' => @user.full_name,'age' => @user.age, status: :ok}
	end
	def show
		find_user
		render json: {'name' => @user.full_name,'age' => @user.age, status: :ok}
	end

	def create
		@user = User.new(user_params)
		@user.save
		render json: @user, status: :created
	end

	def destroy
		if @user.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :address_line_1, :dob, :email, :password, :password_confirmation)
		end
		def set_user
			@user = current_user
		end
		def find_user
			@user = User.find(params[:id])
		end
end
