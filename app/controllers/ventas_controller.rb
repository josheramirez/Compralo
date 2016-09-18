class VentasController < ApplicationController

def index
	@ventas=Compra.all

end

def show
	#@ventas=current_user.compras.all
	@detalle = Compra.find(params[:id])
end

end