module SessionsHelper

	#creo el cookie
	def log_in(user)
		session[:user_id] = user.id
	end

	# Remembers a user in a persistent session. 
	# tomo los datos del ususario logeado
	def remember(user)
		# llamo metodo remember para crear el remember_token del ususario
		user.remember
		#asigno cookie id
		cookies.permanent.signed[:user_id] = user.id
		#asigno cookie remmeber_token
		cookies.permanent[:remember_token] = user.remember_token
	end

	# retorno si hay o no un usuario logeado, @current_user parte vacio
	def current_user

# if session[:user_id]
# @current_user ||= User.find_by(id: session[:user_id])
# elsif cookies.signed[:user_id]
# user = User.find_by(id: cookies.signed[:user_id])
# if user && user.authenticated?(cookies[:remember_token])
# log_in user
# @current_user = user
# end
# end

		if (user_id = session[:user_id])
		@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
		user = User.find_by(id: user_id)
		if user && user.authenticated?(cookies[:remember_token])
		log_in user
		@current_user = user
		end
		end

		#if @current_user.nil?
		#@current_user = User.find_by(id: session[:user_id])
		#else
		#@current_user
		#end
		
		#es equivalente al codigo de arriba
		#@current_user ||= User.find_by(id: session[:user_id])

	end

	# true si hay usuario loggeado
	def logged_in?
		!current_user.nil?
	end

	# # Logs out quita las cookies y deja null current_user
	# def log_out
	# 	session.delete(:user_id)
	# 	@current_user = nil
	# end


# Forgets a persistent session.
def forget(user)
user.forget
cookies.delete(:user_id)
cookies.delete(:remember_token)
end
# Logs out the current user.
def log_out
forget(current_user)
session.delete(:user_id)
@current_user = nil
end

end
