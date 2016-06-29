class UsersController < ApplicationController
#antes de acceder a metodo edit o update , se hace logged_in_user
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user,only: [:edit, :update]
#confirma q solo administrador pueda borrar
before_action :admin_user,only: :destroy

	def index
	 @users = User.paginate(page: params[:page])
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)

		#si es valido los parametro si se guarda
		if @user.save
			#logeo al usuario recien creado

			#mando mail
			@user.send_activation_email

			#log_in @user
			flash[:info] = "Por favor revisa tu mail para activar tu cuenta."
			#flash[:success] = "Bienvenido a Compralo!"
			redirect_to root_url
		else
			render 'new'
		end
	end
	
	

	def edit
	@user = User.find(params[:id])
	end

def update
@user = User.find(params[:id])
if @user.update_attributes(user_params)
flash[:success] = "Cuenta actualizada"
redirect_to @user
else
render 'edit'
end
end

def destroy
User.find(params[:id]).destroy
flash[:success] = "Usuario borrado"
redirect_to users_url
end

	private
	
	def user_params
		params.require(:user).permit(	:name, :email, :password,
										:password_confirmation, :calle_envio,
										:numero_envio, :comuna_envio,
										:numero_contacto)
	end

	# Before filters
	# Confirms a logged-in user.
	def logged_in_user
	unless logged_in?
		store_location
	flash[:danger] = "Please log in."
	redirect_to login_url
	end
	end

	# Confirms the correct user.
	def correct_user
	@user = User.find(params[:id])
	redirect_to(root_url) unless current_user?(@user)
	end

	# Confirms an admin user.
	def admin_user
	redirect_to(root_url) unless current_user.admin?
	end

end
