class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end

	def update
		super
	end

	private

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :address_line_1, :dob, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :address_line_1, :dob, :email, :password, :password_confirmation, :current_password)
	end
end
