class TransfersController < ApplicationController
	before_action :set_user, only: [:new, :create]

	def new
		@transfer = @user.transfers.new
	end

	def create
		if @user.transfers.create(transfer_params)
			redirect_to user_path(@user)
		else
			render 'users/show'
		end
	end


	private
	def set_user
		@user = User.find(params[:user_id])
	end
	def transfer_params
		params.require(:transfer).permit(:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to)
	end
end
