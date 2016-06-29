class AccountActivationsController < ApplicationController

	def  edit 
		user = User.find_by(email: params[:email])
		if user &&  !user.activated? && user.authenticated?(:activation, params[:id])
			user.activated
  			flash[:success] ="Cuenta activada!"
  			redirect_to user
  		else
  			flash[:danger] ="Link invalido"	
  			redirect_to root_url 
		end
	end 
end
