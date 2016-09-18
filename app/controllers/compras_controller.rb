class ComprasController < ApplicationController


def index
	@ventas=Compra.all

end

def show
	#@ventas=current_user.compras.all
	#@detalle =Pedido.where(compra_id: params[:id])
	@detalle =Compra.find(params[:id])

end

end