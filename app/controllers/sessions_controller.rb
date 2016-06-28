class SessionsController < ApplicationController
  
  def new
  end
  
  def create
  	#busco al ususario en la base de datos 
  	user = User.find_by(email: params[:session][:email].downcase)
  	#valido al usario
	if user && user.authenticate(params[:session][:password])
		#creo cookies
		log_in user
		#si esta clickeado hago remember user sino forget user
		params[:session][:remember_me] == '1' ? remember(user) : forget(user)	
			#remember (user), es lo mismo q abajo en session helper
			#remember user
	redirect_back_or user
		#redirijo a pagina perfil del ususario , user_url(user)
		#redirect_to user
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
