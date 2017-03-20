class V1::TransfersController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:index], raise: false
	before_action :set_transfer, only: [:destroy, :index, :update, :show]
	def index

	end
	def show
		renderJsonWithoutID
	end

	def create
		@user = User.find(params[:id])
		@transfer = @user.transfers.build(transfer_params) # building on the user's transfers relation allows the user id to be inferred

		if @transfer.save
			render json: @transfer, status: :created
		else
			render json: @transfer, status: 422
		end

	end

	def update
		if @transfer.update(transfer_params)
			render json: @transfer, status: 200
		else
			render json: @transfer, status: 422
		end
	end

	def destroy
		if @transfer.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end
	end

	private
	def renderJsonWithoutID
		render json: @transfer, :only => [:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to]
	end

	def set_transfer
		@transfer = Transfer.find(params[:id])
	end
	def transfer_params
		params.require(:transfer).permit(:account_number_from, :account_number_to, :amount_pennies, :country_code_from, :country_code_to)
	end
end
