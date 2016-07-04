# class AccountActivationsController < ApplicationController

# 	def  edit 
# 		user = User.find_by(email: params[:email])
# 		if user &&  !user.activated? && user.authenticated?(:activation, params[:id])
# 			user.activated
#   			flash[:success] ="Cuenta activada!"
#   			redirect_to user
#   		else
#   			flash[:danger] ="Link invalido"	
#   			redirect_to root_url 
# 		end
# 	end 
# end


class AccountActivationsController < ApplicationController

	def edit
		user=User.find_by(email:params[:email])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
			user.update_attribute(:activated, true)
			user.update_attribute(:activated_at, Time.zone.now)
			log_in user
			flash[:success]= "Tu cuenta a sido activada!"
			redirect_to user
		else
			flash[:danger]=	"Activacion no valida"
			redirect_to root_url
		end

	end

end
 