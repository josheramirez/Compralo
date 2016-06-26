class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			#logeo al usuario recien creado
			log_in @user
			flash[:success] = "Bienvenido a Compralo!"
			redirect_to @user
		else
			render 'new'
		end
	end
	
	def destroy
		log_out
		redirect_to root_url
	end

	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password,
		:password_confirmation)
	end

end
