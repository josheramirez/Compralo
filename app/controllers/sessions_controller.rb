class SessionsController < ApplicationController
  
	  def new
	  end
  
	  def create
		 #busco al ususario en la base de datos 
	 	user = User.find_by(email: params[:session][:email].downcase)
		  	#valido al usario
			if user && user.authenticate(params[:session][:password])
				if user.activated?
					log_in user
					params[:session][:remember_me] == '1' ? remember(user) : forget(user)
					redirect_back_or root_url
				else
					message = "Cuenta inactiva. "
					message += "Revisa tu mail para activar tu cuenta."
					flash[:warning] = message
					redirect_to root_url
				end    
			else
				#flash[:danger] = 'Invalid email/password combination' //queda pegado el mensaje
				flash.now[:danger] = 'Combinacion email/password incorrecto' # .now arregla el problema de pegado
				render 'new'
			end
	  end
  
	def destroy
		log_out if logged_in?
		redirect_to root_url
	end 

end
