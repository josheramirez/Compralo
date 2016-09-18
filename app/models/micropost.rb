class Micropost < ActiveRecord::Base
 	belongs_to :user
 	belongs_to :compra
 	has_many :compras
 	has_many :pedidos
 	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	validates :precio, presence: true
	validates :cantidad, presence: true 
	validates :mt3, presence: true
	validates :hrs, presence: true


	def es_venta?
		self.tipo=="venta"
	end


	def es_pregunta?(micropost)
		micropost=="pregunta"
	end

	def es_compra?(micropost)
		micropost=="compra"
	end

end
