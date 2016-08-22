class Micropost < ActiveRecord::Base
 	belongs_to :user
 	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 140 }
	#validates :precio, presence: true
	validates :cantidad, presence: true 



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
