
class MicropostsController < ApplicationController
	before_action :logged_in_user, only:[:create, :destroy]
	before_action :correct_user,   only:[:destroy]
	
	
	def show
		@micropost1 = Micropost.find(params[:id])
		#creo en memoria un objeto micropost con user_id relasionado a diferencia de micropost.new q crea un objeto micropost vacio
		@micropost2 = current_user.microposts.build
		#@micropost2 = Micropost.new
	end
	
	def new
		@micropost2 = Micropost.new
	end
	
	def algo
		@dato=params[:id];
	end

	def ventas_publicadas
		@ventas_publicadas=Micropost.where(user_id: current_user.id)
	end

	def bodega
		@user=current_user
		@en_bodega=Micropost.where("fecha_llegada < ?", DateTime.now)
		@fecha=DateTime.now

		# @capacidad_bodega=current_user.mt2 

		
		@en_bodega.each do |bodega| 
		# 	if(@capacidad_bodega>bodega.mt3)
		# 	@capacidad_bodega=@capacidad_bodega-bodega.mt3
		 	bodega.update_attributes(estado: "en_bodega")
		# 	bodega.mt3
		# 	end
		end 



	end




	def create

		if current_user.vendedor?
			@micropost = current_user.microposts.build(micropost_params)
			@micropost.cantidad_nueva=@micropost.cantidad
			@micropost.tipo="publico"
			@micropost.fecha_llegada=DateTime.now + (@micropost.hrs.to_f/24)


			# si pasa el micropost_params y se crea en base de datos
			# .save pasa de virtual a base de datos 
				if @micropost.save

					flash[:success]="Venta publicada!"
					redirect_to root_url
				else
			# en este controlador no existe atributo @feed_items
			# por se carga solo la vista no el controlador?
			#@feed_items=[]
			#render 'static_pages/home'
					flash[:danger]="Hay errores en tu publicacion ingresa datos correctos"
					redirect_to root_url
				end

		

		
		else

				
			


			@micropost = current_user.microposts.build(micropost_params)
			@micropost_padre = Micropost.find(@micropost.id_micropost)
					#@compra=Compra.new


				if @micropost.cantidad==nil || @micropost.cantidad==''
					@micropost.cantidad=0;
				end


				if (@micropost_padre.cantidad_nueva-@micropost.cantidad)<0
					flash[:danger]="la cantidad debe ser menor a la disponible"
					redirect_to micropost_path(@micropost_padre.id)
				else

					if (@micropost.cantidad==0)
						flash[:danger]="debes poner una cantidad para comprar / dato incorrecto"
						redirect_to micropost_path(@micropost_padre.id)
					else

					if current_user.vendedor?
					@micropost.tipo="venta"
					else
					end

					if current_user.comprador?
					@micropost.tipo="compra"
					@micropost.mt3=@micropost_padre.mt3*@micropost.cantidad
					else
					end


					if @micropost.tipo=="compra"
							# si pasa el micropost_params y se crea en base de datos
							# .save pasa de virtual a base de datos 

					# CREO EL POST DE COMPRA		
							if @micropost.save
								# actualizo la nueva cantidad disponible del producto


								nueva_cantidad=@micropost_padre.cantidad_nueva-@micropost.cantidad
								@micropost_padre.update_attributes(cantidad_nueva:  nueva_cantidad)

								current_user.compras.create(cantidad: @micropost.cantidad,  micropost_id:  @micropost_padre.id)

								flash[:success]="Compra realizada!"
								redirect_to root_url
							else
								# en este controlador no existe atributo @feed_items
								# por se carga solo la vista no el controlador?

								#@feed_items=[]
								#render 'static_pages/home'

							
								flash[:danger]=@micropost.errors.full_messages[0]
								#redirect_to root_url
								#lo mando a show
								redirect_to micropost_path(@micropost.id_micropost)


								#render 'micropost/@micropost.user_id'
							end

					else

						# if @micropost.tipo=="venta"
						# 		# si pasa el micropost_params y se crea en base de datos
						# 		# .save pasa de virtual a base de datos 
						# 		if @micropost.save
						# 			flash[:success]="Venta publicada!"
						# 			redirect_to root_url
						# 		else
						# 			# en este controlador no existe atributo @feed_items
						# 			# por se carga solo la vista no el controlador?

						# 			#@feed_items=[]
						# 			#render 'static_pages/home'
						# 			flash[:danger]="Hay errores en tu publicacion"
						# 			redirect_to root_url
									
						# 		end

						# else


						end		


					end

			end



		end

	end

	def destroy
		@micropost.destroy
		flash[:success]="Publicacion borrada"
		redirect_to request.referrer||root_url
	end



	private

	def micropost_params
		#params.require(:micropost).permit(:content, :precio, :cantidad, :tipo, :id_micropost, :cantidad_nueva, :mt3, :hrs)
		params.require(:micropost).permit(:content, :precio, :cantidad, :tipo, :mt3, :hrs)
	end

	def correct_user
		@micropost= current_user.microposts.find_by(id: params[:id] )
		redirect_to root_url if @micropost.nil?
	end

end